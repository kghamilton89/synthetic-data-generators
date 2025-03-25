# Step 2: Import necessary modules
from distilabel.pipeline import Pipeline
from distilabel.tasks import TextGenerationTask
from distilabel.llm import HuggingFaceLLM
from distilabel.dataset import Dataset
from datasets import load_dataset
from huggingface_hub import HfApi, login

# Step 3: Define the Hugging Face model
# Use an open-source model, e.g., "gpt2" or "tiiuae/falcon-7b"
model_name = "gpt2"

# Step 4: Define the task
task = TextGenerationTask(
    instructions=[
        "Explain the concept of quantum computing.",
        "Write a short story about a robot learning to love.",
        "Describe the benefits of renewable energy.",
    ]
)

# Step 5: Define the Hugging Face LLM
llm = HuggingFaceLLM(
    model=model_name,
    task=task,
    device="cpu",  # Use "cuda" if you have a GPU
)

# Step 6: Define the pipeline
pipeline = Pipeline(
    generator=llm,
    num_generations=10,  # Number of samples to generate
)

# Step 7: Generate data
dataset = pipeline.generate()

# Step 8: Convert the dataset to Hugging Face Dataset format
hf_dataset = dataset.to_huggingface()

# Step 9: Log in to Hugging Face Hub
# Replace with your Hugging Face API token
hf_token = "your_hugging_face_token"
login(token=hf_token)

# Step 10: Upload the dataset to Hugging Face Hub
repo_name = "your-username/your-dataset-name"  # Replace with your repo name
hf_dataset.push_to_hub(repo_name)

print(f"Dataset uploaded to Hugging Face Hub: https://huggingface.co/datasets/{repo_name}")