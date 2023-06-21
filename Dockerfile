FROM arm64v8/python

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpq-dev \
    build-essential \
    libssl-dev \
    libffi-dev

# Install Node.js for ARM64
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs

# Set the working directory in the container
WORKDIR /app

# Install Python dependencies
RUN pip install --no-cache-dir cryptography
# RUN pip install --no-cache-dir pyNaCl==1.3.0

# # Copy the requirements.txt file to the container
# COPY requirements.txt .

# # Install additional Python dependencies
# RUN pip install --no-cache-dir -r requirements.txt

# # Copy the Django project files to the container
# COPY . .

# # Expose the Django development server port
# EXPOSE 8000

# # Start the Django development server
# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]