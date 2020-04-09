You could replace `value = json_obj['a']['b']['c']['d']['e']` with:

    value = reduce(dict.__getitem__, 'abcde', json_obj)

If you already have the path `a/b/c/..` as a list. For example, [Change values in dict of nested dicts using items in a list](https://stackoverflow.com/a/11919150/4279).

**Function composition**: If you already have a list of functions that you'd like to apply in succession, such as:

    color = lambda x: x.replace('brown', 'blue')
    speed = lambda x: x.replace('quick', 'slow')
    work = lambda x: x.replace('lazy', 'industrious')
    fs = [str.lower, color, speed, work, str.title]

Then you can apply them all consecutively with:

    >>> call = lambda s, func: func(s)
    >>> s = "The Quick Brown Fox Jumps Over the Lazy Dog"
    >>> reduce(call, fs, s)
    'The Slow Blue Fox Jumps Over The Industrious Dog'

In this case, method chaining may be more readable. But sometimes it isn't possible, and this kind of composition may be more readable and maintainable than a `f1(f2(f3(f4(x))))` kind of syntax.
