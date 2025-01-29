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
(The environment.yml file installs also numba and graphviz, that are used sparingly)



For my testing (on WSL2), I also have an enviroment named pdl_gpu which was created like this which uses environmengpu.yml
 
This is not portable, and the particular version of cuda you need may vary. (Use `nvidia-smi`)
 
Note make sure to update / upgrade with conda before doing this . 

## Note on part 2
For part two, I sometimes need more compute, so I will be using Paperspace Gradient. I used a 'start from scratch' notebook. To setup I created a simple notebook that does  
`!pip install -Uq diffusers transformers fastcore`
And can do the huggingspace login if needed but not sure when it is needed, I did not seem to need it for lesson 9.


For working locally with minai I also create a pyproject.toml so that one can do `pip install -e .` to install the library. 

- Note that conda is not available on paperspace (at least not in the docker container i have found so far) so one has to use pip. I added dependances to pyproject, so one should be able to clone the repo, then do :

```
pip install -e .
```
 
