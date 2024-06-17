from fastai.vision.all import *
import gradio as gr

def is_cat(x): return x[0].isupper()

learn = load_learner('model.pkl')


# define prediction model   

def predict(img):
    img = PILImage.create(img)
    pred,pred_idx,probs = learn.predict(img)
    return {'Cat': float(probs[1]), 'Noncat' : float(probs[0])}


demo = gr.Interface(fn=predict,
                     inputs=gr.Image(height= 512, width =512), 
                     outputs=gr.Label(num_top_classes=2), 
                     title = "Is it a cat?")


demo.launch()