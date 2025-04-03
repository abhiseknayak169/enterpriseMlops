import pathlib
import os 
import enterprise_mlops_project_1
# Path to the root directory of the project - test
ROOT_DIR = pathlib.Path(enterprise_mlops_project_1.__file__).resolve().parent

DATA_DIR = os.path.join(ROOT_DIR, 'data','raw')
file_name = "iris.csv"

file_path = os.path.join(DATA_DIR, file_name)

MODEL_NAME = "iris_model.joblib"
SAVE_MODEL_DIR = os.path.join(ROOT_DIR, 'model')