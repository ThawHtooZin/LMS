# Copy this file to config.py and fill in the key and model.
# Groq's OpenAI-compatible endpoint is the default. The model must support tool calls.

API_KEY = ""
MODEL = "openai/gpt-oss-120b"
BASE_URL = "https://api.groq.com/openai/v1"

TEMPERATURE = 1
TOP_P = 1
MAX_COMPLETION_TOKENS = 2048
REASONING_EFFORT = "medium"

# XAMPP address of this project. The Python service calls the report endpoints here.
LMS_BASE = "http://127.0.0.1/LMS"
