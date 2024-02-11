# Use the official Python image as the base image
FROM python:3.10.0-alpine3.15
# Set the working directory in the container
WORKDIR /app


# Copy the Python dependencies file to the container
COPY requirement.txt .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirement.txt

# Copy the Flask application code to the container
#COPY . .
COPY src src


#RUN python3 -m venv venv

# Expose the port the Flask application will run on
EXPOSE 5000
HEALTHCHECK --interval=30s --timeout=30s --start-period=30s --retries=3 \
               CMD curl -f http://localhost:5000/health || exit 1
ENTRYPOINT [ "python", "./src/app.py"]

# Command to run the Flask application when the container sarts
#CMD ["python", "app.py"]
#CMD [ "python", "-m" , "flask", "run", "--host=0.0.0.0"]


##########################################################################################
##########################################################################################
#FROM gcr.io/distroless/python3

#copy the compiled binrary from the build stage
#COPY --from=build /app /appl
#ENTRYPOINT ["/appl"]
