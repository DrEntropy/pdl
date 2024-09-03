# Working directory for PDL course

This is just my working notes for going through the course [Practical Deep Learning For Coders](https://course.fast.ai/).

This uses a conda environment called pdl_p  (practical deep learning practice)
This enviroment doesn't use the GPU (so should be portable) and can be created either by:

```
conda install jupyter
conda install -c fastai fastai
conda install -c fastai nbdev
conda install gradio
```
Or 

```
conda env create -f environment.yml
```

For my testing, I also have an enviroment named pdl_gpu which was created like this:
```
conda install pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia 
conda install jupyter
conda install -c fastai fastai
```
This is not portable, and the particular version of cuda you need may vary. (Use `nvidia-smi`)
 
Note make sure to update / upgrade with conda before doing this . 

## Note on part 2
For part two, I need more compute, so I will be using Paperspace Gradient. I used a 'start from scratch' notebook. To setup I created a simple notebook that does  
`!pip install -Uq diffusers transformers fastcore`
And can do the huggingspace login if needed