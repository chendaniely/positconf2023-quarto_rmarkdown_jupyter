# positconf2023-quarto_rmarkdown_jupyter

View slides:

- https://chendaniely.github.io/positconf2023-quarto_rmarkdown_jupyter/

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
  python3     /home/dan/git/hub/positconf2023-quarto_rmarkdown_jupyter/venv/share/jupyter/kernels/python3

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
