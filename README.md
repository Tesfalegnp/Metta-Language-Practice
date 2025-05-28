# Beginner Metta Language Practice Code

**This repository contains a collection of beginner-friendly Metta language practice code examples.**

## Description

This repository is designed to help individuals who are new to the Metta programming language. It provides a series of simple examples that demonstrate basic concepts and syntax. By working through these examples, you can gain a foundational understanding of Metta and its capabilities.

**This is for Beginner Metta Language Practice Code -- Try to code each file in your Local computer**

## How to Run

To run the Metta code in this repository, you'll need to set up your local environment with the following dependencies:

1.  **Python 3:** Metta requires Python 3. Ensure that you have Python 3 installed on your system. You can download it from the official Python website: [https://www.python.org/downloads/](https://www.python.org/downloads/)

2.  **Hyperon:** Metta is implemented on top of the Hyperon execution engine. You need to install the Hyperon Python package. You can install it using pip:

    ```bash
    pip install hyperon==0.2.2
    ```

    **Note:** It's important to use version `0.2.2` to maintain compatibility with the examples in this repository.

3.  **Virtual Environment (Recommended):** It's highly recommended to create a virtual environment to isolate your project dependencies and avoid conflicts with other Python projects. You can create a virtual environment using the following commands:

    ```bash
    python3 -m venv venv
    source venv/bin/activate  # On Linux/macOS
    venv\Scripts\activate  # On Windows
    ```

    After activating the virtual environment, you can install the required packages using pip as described above.

## Usage

1.  **Clone the Repository:** Clone this repository to your local machine using Git:

    ```bash
    git clone (https://github.com/Tesfalegnp/Metta-Language-Practice.git)
    ```

2.  **Navigate to the Directory:** Change your current directory to the cloned repository:

    ```bash
    cd [repository directory]
    ```

3.  **Run the Metta Code:** Each `.metta` file in the repository contains Metta code examples. You can run these files using the Hyperon interpreter. For example, to run `example1.metta`, use the following command:

    ```bash
    python3 -m hyperon Map_Determinism.metta
    ```


## Contributing

Contributions to this repository are welcome! If you have any improvements, bug fixes, or new examples, please feel free to submit a pull request.

## License

This repository is licensed under the [MIT License](LICENSE).
