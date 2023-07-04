@echo off

cd "docs\flaskapp"

if not exist "venv" (
    python -m venv venv
)

call venv\Scripts\activate

python -m pip install -r requirements.txt

echo Starting the Flask app...
start "" cmd /k "flask run"

echo Flask app is running.

echo Environment set up successfully!

echo Running setup.py...
python setup.py