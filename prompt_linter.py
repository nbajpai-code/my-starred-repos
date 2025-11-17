#!/usr/bin/env python3
"""
Prompt Linter - Comprehensive LLM Prompt Validation and Analysis Tool

This tool performs static analysis on LLM prompts to detect:
- Security issues (injection vulnerabilities, PII)
- Clarity problems (ambiguous instructions, missing context)
- Performance issues (excessive length, poor structure)
- Best practice violations
"""

import re
import json
import sys
from typing import List, Dict, Tuple
from dataclasses import dataclass
from enum import Enum


class Severity(Enum):
    ERROR = "ERROR"
    WARNING = "WARNING"
    INFO = "INFO"


@dataclass
class LintIssue:
    severity: Severity
    category: str
    message: str
    line: int = 0
    suggestion: str = ""


class PromptLinter:
    def __init__(self):
        self.issues: List[LintIssue] = []

        # Common prompt injection patterns
        self.injection_patterns = [
            r"ignore (previous|all|above) (instructions|prompts|commands)",
            r"disregard (previous|all|above)",
            r"forget (everything|all|previous)",
            r"new (instructions|task|prompt):",
            r"system (message|prompt):",
            r"you are now",
            r"act as if",
            r"pretend (you are|to be)",
            r"jailbreak",
            r"DAN mode",
        ]

        # PII patterns
        self.pii_patterns = {
            "SSN": r"\b\d{3}-\d{2}-\d{4}\b",
            "Email": r"\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b",
            "Credit Card": r"\b\d{4}[- ]?\d{4}[- ]?\d{4}[- ]?\d{4}\b",
            "Phone": r"\b\d{3}[-.]?\d{3}[-.]?\d{4}\b",
            "API Key": r"(api[_-]?key|apikey|access[_-]?token)[\s:=]+['\"]?([a-zA-Z0-9_-]{20,})",
        }

        # Anti-patterns
        self.antipatterns = {
            "vague_instruction": r"\b(somehow|maybe|perhaps|kind of|sort of)\b",
            "double_negative": r"\bdon't not\b|\bnot un\w+\b",
            "conflicting": r"(but|however|although|even though).*\1",
        }

    def lint(self, prompt: str) -> List[LintIssue]:
        """Run all linting checks on the prompt"""
        self.issues = []

        # Security checks
        self._check_injection_patterns(prompt)
        self._check_pii(prompt)

        # Clarity checks
        self._check_structure(prompt)
        self._check_ambiguity(prompt)
        self._check_antipatterns(prompt)

        # Performance checks
        self._check_length(prompt)
        self._check_redundancy(prompt)

        # Best practice checks
        self._check_examples(prompt)
        self._check_output_format(prompt)
        self._check_context(prompt)

        return self.issues

    def _check_injection_patterns(self, prompt: str):
        """Detect potential prompt injection attempts"""
        prompt_lower = prompt.lower()

        for pattern in self.injection_patterns:
            if re.search(pattern, prompt_lower, re.IGNORECASE):
                self.issues.append(LintIssue(
                    severity=Severity.ERROR,
                    category="Security",
                    message=f"Potential prompt injection pattern detected: '{pattern}'",
                    suggestion="Review and sanitize user input. Consider using input validation."
                ))

    def _check_pii(self, prompt: str):
        """Detect personally identifiable information"""
        for pii_type, pattern in self.pii_patterns.items():
            matches = re.findall(pattern, prompt, re.IGNORECASE)
            if matches:
                self.issues.append(LintIssue(
                    severity=Severity.ERROR,
                    category="Security",
                    message=f"Potential {pii_type} detected in prompt",
                    suggestion="Remove PII from prompts. Use placeholders or anonymize data."
                ))

    def _check_structure(self, prompt: str):
        """Check for proper prompt structure"""
        lines = prompt.strip().split('\n')

        # Check for sections/organization
        has_sections = bool(re.search(r'^(#{1,6}|\*\*|__|\d+\.)', prompt, re.MULTILINE))

        if len(lines) > 10 and not has_sections:
            self.issues.append(LintIssue(
                severity=Severity.WARNING,
                category="Structure",
                message="Long prompt lacks clear sections or organization",
                suggestion="Use headings, bullet points, or numbered lists to organize content."
            ))

        # Check for instruction clarity
        if not re.search(r'\b(you should|please|must|need to|task:|instruction:|goal:)', prompt, re.IGNORECASE):
            self.issues.append(LintIssue(
                severity=Severity.WARNING,
                category="Clarity",
                message="No clear instructions or directives found",
                suggestion="Add explicit instructions using imperative language."
            ))

    def _check_ambiguity(self, prompt: str):
        """Detect ambiguous or vague language"""
        vague_words = ['thing', 'stuff', 'something', 'anything', 'everything',
                       'someone', 'anyone', 'everybody', 'it', 'this', 'that']

        prompt_lower = prompt.lower()
        found_vague = [word for word in vague_words if f' {word} ' in f' {prompt_lower} ']

        if found_vague:
            self.issues.append(LintIssue(
                severity=Severity.INFO,
                category="Clarity",
                message=f"Vague terms detected: {', '.join(set(found_vague))}",
                suggestion="Use specific, concrete terms instead of vague language."
            ))

    def _check_antipatterns(self, prompt: str):
        """Check for common anti-patterns"""
        for antipattern_type, pattern in self.antipatterns.items():
            if re.search(pattern, prompt, re.IGNORECASE):
                self.issues.append(LintIssue(
                    severity=Severity.WARNING,
                    category="Anti-pattern",
                    message=f"Anti-pattern detected: {antipattern_type.replace('_', ' ')}",
                    suggestion="Rephrase to be more direct and clear."
                ))

    def _check_length(self, prompt: str):
        """Check prompt length and token estimation"""
        char_count = len(prompt)
        word_count = len(prompt.split())
        estimated_tokens = word_count * 1.3  # Rough estimate

        if char_count > 10000:
            self.issues.append(LintIssue(
                severity=Severity.WARNING,
                category="Performance",
                message=f"Very long prompt ({char_count} chars, ~{int(estimated_tokens)} tokens)",
                suggestion="Consider splitting into smaller prompts or using RAG."
            ))

        if char_count < 20:
            self.issues.append(LintIssue(
                severity=Severity.WARNING,
                category="Performance",
                message="Prompt is very short and may lack context",
                suggestion="Add more context and specific instructions."
            ))

    def _check_redundancy(self, prompt: str):
        """Detect redundant or repetitive content"""
        sentences = re.split(r'[.!?]+', prompt)
        sentences = [s.strip() for s in sentences if s.strip()]

        if len(sentences) > 5:
            # Simple check for repeated sentences
            unique_sentences = set(sentences)
            redundancy_ratio = 1 - (len(unique_sentences) / len(sentences))

            if redundancy_ratio > 0.3:
                self.issues.append(LintIssue(
                    severity=Severity.INFO,
                    category="Performance",
                    message=f"High redundancy detected ({redundancy_ratio:.0%} repeated content)",
                    suggestion="Remove duplicate or repetitive instructions."
                ))

    def _check_examples(self, prompt: str):
        """Check if examples are provided (few-shot learning)"""
        has_examples = bool(re.search(r'(example|e\.g\.|for instance|such as|like this):', prompt, re.IGNORECASE))
        has_code_blocks = bool(re.search(r'```[\s\S]*?```', prompt))

        if len(prompt) > 200 and not (has_examples or has_code_blocks):
            self.issues.append(LintIssue(
                severity=Severity.INFO,
                category="Best Practice",
                message="No examples provided in prompt",
                suggestion="Consider adding examples (few-shot learning) to improve accuracy."
            ))

    def _check_output_format(self, prompt: str):
        """Check if output format is specified"""
        format_keywords = [
            'format', 'structure', 'json', 'xml', 'markdown', 'csv',
            'output should', 'respond with', 'return'
        ]

        has_format = any(keyword in prompt.lower() for keyword in format_keywords)

        if len(prompt) > 100 and not has_format:
            self.issues.append(LintIssue(
                severity=Severity.INFO,
                category="Best Practice",
                message="No output format specification found",
                suggestion="Specify desired output format (JSON, markdown, etc.) for consistency."
            ))

    def _check_context(self, prompt: str):
        """Check for context and role definition"""
        has_role = bool(re.search(r'(you are|act as|role:|as a)', prompt, re.IGNORECASE))
        has_context = bool(re.search(r'(context:|background:|given|assume)', prompt, re.IGNORECASE))

        if len(prompt) > 150 and not has_role:
            self.issues.append(LintIssue(
                severity=Severity.INFO,
                category="Best Practice",
                message="No role or persona defined for the AI",
                suggestion="Define a role/persona (e.g., 'You are an expert...')."
            ))

    def format_report(self, issues: List[LintIssue]) -> str:
        """Format linting results as a readable report"""
        if not issues:
            return "✅ No issues found! Prompt looks good.\n"

        report = []
        report.append(f"\n🔍 Prompt Linting Results: {len(issues)} issue(s) found\n")
        report.append("=" * 80)

        # Group by severity
        errors = [i for i in issues if i.severity == Severity.ERROR]
        warnings = [i for i in issues if i.severity == Severity.WARNING]
        info = [i for i in issues if i.severity == Severity.INFO]

        for severity_group, label, emoji in [
            (errors, "ERRORS", "🚨"),
            (warnings, "WARNINGS", "⚠️"),
            (info, "INFO", "ℹ️")
        ]:
            if severity_group:
                report.append(f"\n{emoji} {label} ({len(severity_group)})")
                report.append("-" * 80)
                for issue in severity_group:
                    report.append(f"\n[{issue.category}] {issue.message}")
                    if issue.suggestion:
                        report.append(f"  💡 Suggestion: {issue.suggestion}")

        report.append("\n" + "=" * 80)
        return "\n".join(report)


def main():
    """CLI interface for prompt linter"""
    if len(sys.argv) < 2:
        print("Usage: python prompt_linter.py <prompt_text> or python prompt_linter.py --file <prompt_file>")
        print("\nExample:")
        print('  python prompt_linter.py "Write a story about a cat"')
        print('  python prompt_linter.py --file my_prompt.txt')
        sys.exit(1)

    linter = PromptLinter()

    # Read prompt from file or command line
    if sys.argv[1] == '--file':
        if len(sys.argv) < 3:
            print("Error: Please specify a file path")
            sys.exit(1)
        with open(sys.argv[2], 'r') as f:
            prompt = f.read()
    else:
        prompt = ' '.join(sys.argv[1:])

    # Run linter
    issues = linter.lint(prompt)
    report = linter.format_report(issues)
    print(report)

    # Exit with error code if there are errors
    error_count = sum(1 for i in issues if i.severity == Severity.ERROR)
    sys.exit(1 if error_count > 0 else 0)


if __name__ == "__main__":
    main()
