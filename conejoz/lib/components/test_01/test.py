from dotenv import find_dotenv, load_dotenv
from transformers import pipeline

load_dotenv(find_dotenv())

# text to image
text_to_image = pipeline("text2image", model="microsoft/layoutlm-base-uncased")