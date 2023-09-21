# rstatsnyc-2023-quarto

View slides:

- https://chendaniely.quarto.pub/rstatsnyc-rmd-jupyter-quarto/
- https://speakerdeck.com/chendaniely/moving-to-quarto-from-rmarkdown-and-python-jupyter-notebooks

## Setup Repository

Python setup

```shell
python3 -m venv venv
source venv/bin/activate

pip intall -r requirements.txt

jupyter kernelspec list # should see current venv as python3 kernel
```

```
Available kernels:
  python3     /home/dan/git/hub/rstatsnyc-2023-quarto/venv/share/jupyter/kernels/python3

```

R Setup

```shell
# install.packages("renv")
renv::restore()
```
You may need to manually install + setup `IRkernel`:

```r
install.packages('IRkernel')
IRkernel::installspec() 
```
