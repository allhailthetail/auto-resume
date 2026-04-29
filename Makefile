# Makefile for auto-resume project

# Default target: compile resume using yaml/resume_data.yaml
all: default

# Compile resume.pdf from yaml/resume_data.yaml
default:
	typst compile --input data=yaml/data.yaml main.typ output/default.pdf

# Example target: compile example.pdf from examples/example.yaml
example: 
	typst compile --input data=yaml/example.yaml main.typ output/example.pdf

# Clean target to remove generated PDFs
clean:
	rm -f output/*.pdf