# import google.generativeai as genai
# from django.conf import settings

# # Configure the Google API client with the API key from settings.py
# genai.configure(api_key=settings.GOOGLE_API_KEY)

# # Define any configurations for the model
# generation_config = {
#     "temperature": 1,
#     "top_p": 0.95,
#     "top_k": 64,
#     "max_output_tokens": 8192,
#     "response_mime_type": "text/plain",
# }

# safety_settings = [
#     {
#         "category": "HARM_CATEGORY_HARASSMENT",
#         "threshold": "BLOCK_MEDIUM_AND_ABOVE",
#     },
#     {
#         "category": "HARM_CATEGORY_HATE_SPEECH",
#         "threshold": "BLOCK_MEDIUM_AND_ABOVE",
#     },
#     {
#         "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
#         "threshold": "BLOCK_MEDIUM_AND_ABOVE",
#     },
#     {
#         "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
#         "threshold": "BLOCK_MEDIUM_AND_ABOVE",
#     },
# ]

# model = genai.GenerativeModel(
#     model_name="gemini-1.5-flash-latest",
#     safety_settings=safety_settings,
#     generation_config=generation_config,
# )
