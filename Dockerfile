FROM continuumio/miniconda3:latest

# Set working directory
WORKDIR /physics_informed_encoder

# Copy required files and directories
COPY 1-Battery_and_Heating_Data_in_Real_Driving_Cycles-Encoder-and-Physics.ipynb .
COPY 2-Compare_results_of_several_models.ipynb .
COPY requirements.txt .
COPY data ./data

# Create environment and install dependencies
RUN conda create -n thesis_physics_informed_encoder python=3.9 && \
    echo "source activate thesis_physics_informed_encoder" >> ~/.bashrc && \
    /bin/bash -c "source activate thesis_physics_informed_encoder && pip install torch --index-url https://download.pytorch.org/whl/cu124 && pip install -r requirements.txt"

# Use the environment in the CMD instruction and start jupyter lab
CMD ["bash", "-c", "source activate thesis_physics_informed_encoder && jupyter-lab --allow-root --ip=0.0.0.0 --no-browser"]


