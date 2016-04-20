Since we host html pages from svn repository, it is important to get the [mime types](http://en.wikipedia.org/wiki/Internet_media_type) correct, otherwise the pages will be displayed as plain text. If you are using the [tortoise SVN client](http://tortoisesvn.net/) for windows, follow these steps:

  1. Right click on a directory and select TortoiseSVN --> Settings
  1. Press the edit button under "General" "Subversion" "Subversion configuration file:"
  1. Add or modify these lines and save the file.

```
*.png = svn:mime-type=image/png
*.jpg = svn:mime-type=image/jpeg
*.html = svn:mime-type=text/html
```

Command line svn users should refer to [this](http://svnbook.red-bean.com/) excellent online book.