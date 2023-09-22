### How to set the default working directory of all Jupyter Notebooks as the project's parent folder
Try the following options:
1. Pass PYTHONPATH to Run JupyterLab 
```sh
PYTHONPATH=/path/to/your/lab/root:$PYTHONPATH jupyter lab
```

2. Manually append the path to sys.path in the first cell of the notebook
```python
import sys
extra_path = ... # whatever it is
if extra_path not in sys.path:
    sys.path.append(extra_path)
```

3. As a System Configuration:
Modify `~/.ipython/profile_default/ipython_config.py` using the shell functionality so that the path gets modified for every notebook.
If that file does not exist, create it by using `ipython profile create`.

Then insert the modification to `sys.path` into it by modifying the `c.InteractiveShellApp.exec_lines` variable, e.g.
```py
c.InteractiveShellApp.exec_lines = [
 'import sys; sys.path.append(<path to append>)'
]
```
Sources
-------
* https://stackoverflow.com/questions/15514593/importerror-no-module-named-when-trying-to-run-python-script/40158616#40158616
* https://stackoverflow.com/questions/69394705/how-to-set-the-default-working-directory-of-all-jupyter-notebooks-as-the-project/69399208#69399208
* https://stackoverflow.com/questions/71755156/how-to-add-to-the-pythonpath-in-jupyter-lab

