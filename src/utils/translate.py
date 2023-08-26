#pip install googletrans==4.0.0-rc1

from googletrans import Translator

def traduzir_texto(texto_ingles):
    translator = Translator()
    traducao = translator.translate(texto_ingles, src='en', dest='pt')
    texto_traduzido = traducao.text
    return texto_traduzido

texto_ingles = "Hello, how are you?"
texto_traduzido = traduzir_texto(texto_ingles)
#print(f"Texto em inglês: {texto_ingles}")
print(f"Tradução: {texto_traduzido}")

