
<p align="center">
  <img src="img/banner.png" alt="auto-resume Project Banner" width="100%">
</p>

# auto-resume
A simple generative resume using Typst, YAML, and HTML in order to generate a clean, minimal resume on-the-fly.

## Motivation
Creating a good resume is tiring enough as it is, particularly when casting a wide net. Typesetting applications are wonderful, but tedious for living documents. This is an attempt at making generating tailored resumes much simpler by storing the core data in a `YAML` file, rather than directly in the document's source code. Typst (and probably $\LaTeX$ also) is capable of doing this. Additionally, passing ~YAML~ files to AI agents for proofreading and any other tasks that may suit your imagination becomes much easier 😉.  Finally, I've tested the generated PDFs with resume a few scanning tools, and it seems to perform well extracting the information automatically, which is becoming increasingly important as AI becomes more prevalent at pre-filtering. I hope to put the tool to good use and wish everyone else equally happy trails! Feel free to share and contribute, or don't. 

## Getting Started

First, check out the [example PDF](./examples/example.pdf) and corresponding [YAML](./examples/example.yaml) file containing the data which will populate the resume. Essentially, populate `yaml/data.yaml` with your (job-)specific details and compile! You can use this project either through the Typst online editor or locally on your machine.

### Option 1: Using the Typst Online Editor (Recommended for most users)

1.  **Create a New Project**: Go to [typst.app](https://typst.app/) and create a new project.
2.  **Upload Files**: Upload all the files from this repository to your project.
3.  **Edit Your Data**: Open [yaml/data.yaml](yaml/data.yaml) and replace the placeholder information with your own.
4.  **Compile**

### Option 2: Local Development

If you prefer to work locally, you'll need the [Typst CLI](https://github.com/typst/typst) installed.

1.  **Clone the Repository**:
    ```bash
    git clone https://github.com/your-username/basic-resume.git
    cd basic-resume
    ```
2.  **Install Fonts**: This resume uses [Fira Sans](https://fonts.google.com/specimen/Fira+Sans). Ensure it is installed on your system or placed in a directory Typst can access.
3.  **Compile**:
    ```bash
    typst compile [--input data=my.yaml] main.typ output/resume[-id].pdf
    ```
    Or use watch mode to see changes in real-time with `typst watch`!

## Customization

-   **Data**: All resume content is managed in [yaml/data.yaml](yaml/data.yaml).
-   **Style**: You can adjust the font, spacing, and layout settings in the "USER-CONFIGURABLE SECTION" at the top of [main.typ](main.typ).
-   **Multiple Versions**: You can create multiple YAML files (e.g., `resume_software.yaml`, `resume_manager.yaml`) and switch between them by changing either the default yaml file in `main.typ`, or (preferrably) with a command line modifier.
- **Make integaration:** Check out the [Makefile](Makefile) for ideas to make this even easier.

## Font Configuration
This resume used Carrois Apostrophe's [Fira Sans](https://fonts.google.com/specimen/Fira+Sans) font. If you're compiling this on your local PC, you'll likely need to install the font and/or refer to Typst's documentation for details on how to get the font to work with your specific setup.

# Examples
## Using command line arguments:

```bash
# Point the compiler at your management resume content:
typst compile --input data=tests/resume_management.yaml main.typ output/resume_management.pdf

# Compiles your internship version instead, different YAML file!
typst compile --input data=tests/resume_intern.yaml main.typ output/resume_intern.pdf
```

## Using Make
```
make [target | all | <xyz-tagw> | clean]
```

# Roadmap
- [ ] A corresponding static site hosted using GitHub Pages
- [ ] More templates/options to choose from