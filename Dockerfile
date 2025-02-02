# Use NVIDIA PyTorch image with CUDA and Python preinstalled
FROM nvcr.io/nvidia/pytorch:24.02-py3

# Set working directory
WORKDIR /physics_informed_encoder

# Copy required files and directories
COPY 1-Battery_and_Heating_Data_in_Real_Driving_Cycles-Encoder-and-Physics.ipynb .
COPY 2-Compare_results_of_several_models.ipynb .
COPY requirements.txt .
COPY data ./data

# Install Python dependencies
RUN pip install -r requirements.txt

# Start Jupyter Lab
CMD ["jupyter-lab", "--allow-root", "--ip=0.0.0.0", "--no-browser"]
