#!/bin/bash

# Script to star Quantum Computing and Emerging Technologies repositories
# Created: 2025-11-16

echo "Starting to star Quantum Computing & Emerging Technologies repositories..."

# Array of repositories to star
repos=(
    # ========================================
    # IBM Qiskit - 15 repos
    # ========================================

    "Qiskit/qiskit"
    "Qiskit/qiskit-metapackage"
    "Qiskit/qiskit-tutorials"
    "Qiskit/rustworkx"
    "Qiskit/textbook"
    "Qiskit/qiskit-aer"
    "Qiskit/qiskit-ibmq-provider"
    "Qiskit/qiskit-ibm-runtime"
    "Qiskit/platypus"
    "Qiskit/ecosystem"
    "Qiskit/benchpress"
    "Qiskit/qiskit.org"
    "Qiskit/qiskit-serverless"
    "Qiskit/qiskit-addon-cutting"
    "Qiskit/qiskit-code-assistant-vscode"

    # ========================================
    # Google Quantum (Cirq & OpenFermion) - 10 repos
    # ========================================

    "quantumlib/Cirq"
    "quantumlib/OpenFermion"
    "quantumlib/qsim"
    "quantumlib/Stim"
    "quantumlib/ReCirq"
    "quantumlib/OpenFermion-Cirq"
    "quantumlib/Qualtran"
    "quantumlib/OpenFermion-PySCF"
    "quantumlib/OpenFermion-Psi4"
    "quantumlib/tesseract-decoder"

    # ========================================
    # Amazon Braket - 10 repos
    # ========================================

    "amazon-braket/amazon-braket-examples"
    "amazon-braket/amazon-braket-sdk-python"
    "amazon-braket/Braket.jl"
    "amazon-braket/amazon-braket-algorithm-library"
    "amazon-braket/amazon-braket-default-simulator-python"
    "amazon-braket/amazon-braket-schemas-python"
    "amazon-braket/amazon-braket-pennylane-plugin-python"
    "amazon-braket/amazon-braket-ocean-plugin-python"
    "amazon-braket/BraketAHS.jl"
    "amazon-braket/autoqasm"

    # ========================================
    # Quantum Computing Frameworks - 15 repos
    # ========================================

    "microsoft/QuantumKatas"
    "desireevl/awesome-quantum-computing"
    "PennyLaneAI/pennylane"
    "Classiq/classiq-library"
    "OriginQ/QPanda-2"
    "ProjectQ-Framework/ProjectQ"
    "JackHidary/quantumcomputingbook"
    "AgnostiqHQ/covalent"
    "PennyLaneAI/qml"
    "softwareQinc/qpp"
    "corbett/QuantumComputing"
    "gitkarma/quantum_computing_course2025"
    "Entanglion/entanglion"
    "microsoft/Reference-Guide-For-Quantum-Computing-A-Microsoft-Garage-Project"
    "qiskit-community/qiskit-nature"

    # ========================================
    # WebAssembly (WASM) - 15 repos
    # ========================================

    "tinygo-org/tinygo"
    "mbasso/awesome-wasm"
    "extism/extism"
    "shamadee/web-dsp"
    "wasmlang/awesome-wasm-zh"
    "joelseverin/linux-wasm"
    "RyanLamansky/dotnet-webassembly"
    "torch2424/wasm-by-example"
    "niutech/jxl.js"
    "anderejd/electron-wasm-rust-example"
    "tangledgroup/llama-cpp-wasm"
    "torch2424/made-with-webassembly"
    "RingsNetwork/rings"
    "thlorenz/wasm2js"
    "ibero-data/duck-ui"

    # ========================================
    # Bytecode Alliance (WASM Runtime) - 10 repos
    # ========================================

    "bytecodealliance/wasmtime"
    "bytecodealliance/wasm-micro-runtime"
    "bytecodealliance/lucet"
    "bytecodealliance/javy"
    "bytecodealliance/cranelift"
    "bytecodealliance/rustix"
    "bytecodealliance/wasm-tools"
    "bytecodealliance/wit-bindgen"
    "bytecodealliance/wizer"
    "bytecodealliance/wasmtime-go"

    # ========================================
    # WasmEdge - 10 repos
    # ========================================

    "WasmEdge/WasmEdge"
    "WasmEdge/mediapipe-rs"
    "WasmEdge/wasmedge_hyper_demo"
    "WasmEdge/wasmedge-db-examples"
    "WasmEdge/wasmedge-rust-sdk"
    "WasmEdge/docs"
    "WasmEdge/wasm-log-flex"
    "WasmEdge/wasmedge-stable-diffusion"
    "WasmEdge/wasmedge_reqwest_demo"
    "WasmEdge/wasmedge-async"

    # ========================================
    # Edge Computing - 10 repos
    # ========================================

    "kubeedge/kubeedge"
    "OpenNebula/one"
    "good-lly/s3mini"
    "superedge/superedge"
    "openshift/microshift"
    "revenol/DROO"
    "fangvv/UAV-DDPG"
    "PhuLai/eua-dataset"
    "qijianpeng/awesome-edge-computing"
    "CagataySonmez/EdgeCloudSim"

    # ========================================
    # Neuromorphic Computing - 5 repos
    # ========================================

    "lava-nc/lava"
    "mikeroyal/Neuromorphic-Computing-Guide"
    "thu-nics/MNSIM-2.0"
    "HumanBrainProject/hbp-neuromorphic-client"
    "hisrg/Neural-Network-Compression-and-Accelerator-on-Hardware"
)

# Counter for tracking
total=${#repos[@]}
success=0
failed=0
already_starred=0

# Loop through each repository and star it
for repo in "${repos[@]}"; do
    echo -n "Starring $repo... "

    # Try to star the repository
    result=$(gh api --method PUT -H "Accept: application/vnd.github+json" \
        "/user/starred/$repo" 2>&1)

    if [ $? -eq 0 ]; then
        echo "✓ Success"
        ((success++))
    else
        # Check if already starred
        if echo "$result" | grep -q "Not Found"; then
            echo "✗ Not Found"
            ((failed++))
        else
            echo "✓ Already starred or success"
            ((already_starred++))
        fi
    fi

    # Small delay to avoid rate limiting
    sleep 0.5
done

echo ""
echo "========================================"
echo "Summary:"
echo "Total repositories: $total"
echo "Successfully starred: $success"
echo "Already starred: $already_starred"
echo "Failed (not found): $failed"
echo "========================================"
echo ""
echo "Breakdown by Category:"
echo "  - IBM Qiskit: 15 repos"
echo "  - Google Quantum (Cirq): 10 repos"
echo "  - Amazon Braket: 10 repos"
echo "  - Quantum Frameworks: 15 repos"
echo "  - WebAssembly (WASM): 15 repos"
echo "  - Bytecode Alliance: 10 repos"
echo "  - WasmEdge: 10 repos"
echo "  - Edge Computing: 10 repos"
echo "  - Neuromorphic Computing: 5 repos"
echo "========================================"
echo "Done!"
