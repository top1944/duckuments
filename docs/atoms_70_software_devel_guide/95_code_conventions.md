# Duckietown code conventions {#code-conventions}


## Python {#code-conventions-python}

Never use tabs in the file.

Better: checked by what-the-duck.

Indentation is 4 spaces.

Lines should be below 90 characters.

All files have an encoding declared.

Executable files start with:

    #!/usr/bin/env python

Comments refer to the next line.

Comments, bad:

    from std_msgs.msg import String # This is my long comment

Comments, better:

    # This is my long comment
    from std_msgs.msg import String
