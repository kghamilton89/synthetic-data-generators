# Synthetic Data Generators

A curated collection of synthetic data generation pipelines leveraging state-of-the-art tools such as Bespoke Labs Curator, MOSTLY AI, and Argilla's Distilabel. This repository provides modular, reproducible, and scalable workflows for generating high-quality synthetic datasets for use in machine learning, testing, and privacy-preserving analytics.

---

## Table of Contents

- [Overview](#overview)
- [Tools & Frameworks](#tools--frameworks)
  - [Bespoke Labs Curator](#bespoke-labs-curator)
  - [MOSTLY AI](#mostly-ai)
  - [Argilla Distilabel](#argilla-distilabel)
- [Projects](#projects)
  - [Natality Project](#natality-project)
  - [Traffic Project](#traffic-project)
  - [Reasoning Competition](#reasoning-competition)
  - [Query Demo](#query-demo)
- [Getting Started](#getting-started)
- [License](#license)

---

## Overview

Synthetic data offers solutions to common challenges in real-world datasets, including privacy constraints, bias correction, and class imbalance. This repository brings together tools and templates for generating synthetic data in various formats—structured tables, natural language datasets, and multimodal sources—using advanced open-source and enterprise-ready frameworks.

---

## Tools & Frameworks

### Bespoke Labs Curator

[Bespoke Curator](https://github.com/bespokelabsai/curator) is a modern framework for designing synthetic data pipelines. It provides:

- Declarative YAML-based workflows for data generation
- Built-in support for structured outputs
- Integration with inference engines like vLLM and LiteLLM
- Streamlit-based UI for prompt engineering and dataset curation

Used here for instruction-tuned dataset creation, especially in tasks involving reasoning and dialogue simulation.

### MOSTLY AI

[MOSTLY AI](https://mostly.ai/) provides a powerful SDK for generating statistically representative, privacy-preserving tabular data. Features include:

- Tabular synthetic data generation using ARGN models
- Strong anonymization via differential privacy
- Auto-training pipelines for fast dataset cloning
- Usable via CLI, Python SDK, or web UI

Applied in this repo for generating synthetic customer data, time series, and demo workloads using real or sample database schemas.

### Argilla Distilabel

[Distilabel](https://github.com/argilla-io/distilabel) by Argilla is a data-centric framework for generating synthetic prompts and labels for training and evaluating LLMs. Key features:

- Agent-based synthetic data generation workflows
- Integration with Hugging Face Transformers and Open LLMs
- Built-in quality control and evaluation
- Ideal for chat, classification, summarization tasks

Used in this repo to simulate Q&A datasets and evaluate reasoning pipelines.

---

## Projects

### Natality Project

A synthetic generation pipeline using Bespoke Curator to simulate birth-related data, mimicking public health datasets. Useful for model training where real demographic data is restricted.

### Traffic Project

Synthetic tabular data created with MOSTLY AI to simulate road traffic conditions, vehicle logs, and route behavior, useful for smart city or IoT applications.

### Reasoning Competition

A synthetic benchmark dataset for testing LLM reasoning under constraints (e.g., puzzles, logic tests). Curated with Bespoke Curator to allow structured multi-turn examples.

### Query Demo

An example pipeline combining synthetic queries and corresponding database results, ideal for training search engines or NL2SQL models.

---

## Getting Started

1. **Clone the repository**:

   ```bash
   git clone https://github.com/kghamilton89/synthetic-data-generators.git
   cd synthetic-data-generators
   ```

2. **Set up a Python virtual environment**:

   ```bash
   python -m venv venv
   source venv/bin/activate  # or venv\Scripts\activate on Windows
   ```

3. **Install required dependencies**:

   ```bash
   pip install -r requirements.txt
   ```

4. **Explore individual projects**:

   Navigate to any subfolder to view and run the synthetic data pipeline specific to that project.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

### Contributions

Contributions are welcome! If you have ideas for new synthetic data pipelines or want to expand existing ones with new tools, feel free to open an issue or submit a pull request.

---
