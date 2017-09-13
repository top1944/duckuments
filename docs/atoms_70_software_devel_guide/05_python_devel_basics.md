# Python {#python status=draft}

## Background reading

- Python
- Python tutorial

## Python packages

## Python virtual environments

Install using:

    $ sudo apt install virtualenv

## Useful libraries

    matplotlib
    seaborne
    numpy
    panda
    scipy
    opencv
    ...

## Context managers {#python-context-manager}

TODO: to write

## Exception hierarchies

TODO: to write

TODO: how to catch and re-raise

## Object orientation - Abstract classes, class  hierarchies

TODO: to write

## Downloading resources

Use this recipe if you need to download things:

    from duckietown_utils.download import download_if_not_exist
    url = 'https://www.dropbox.com/s/bzezpw8ivlfu4b0/frame0002.jpg?dl=0'
    f = 'local.jpg'
    download_if_not_exist(url, f)

(Do not commit JPGs and other binary data to the `Software` repository.)

TODO: actually use `urls.yaml`

## IPython

How to enter IPython:

    from IPython import embed()

    a = 10
    embed() # enters interactive mode


## Images

[](python:duckietown_utils.add_header_to_image)

```python
# Add header to image
add_header_to_image(image, s)
```

[](python:duckietown_utils.write_jpg_to_file)

```python
write_jpg_to_file(image, filename)
```

[](python:duckietown_utils.make_images_grid)

```python
make_images_grid
```


## Idioms


    segment_list = copy.deepcopy(segment_list)


See: [add_duckietown_header](python:duckietown_utils.add_duckietown_header)

See: [](python:duckietown_utils.download_if_not_exist)
