# SVN Development Hints & Tips #

If you use the [Tortoise SVN](http://tortoisesvn.net/downloads) client for windows
the following Matlab shortcuts might be of interest to you.


  * SVN Update
```
system('TortoiseProc /command:update /closeonend:1 /path:"C:\pmtk3"');
```

  * SVN Commit
```
system('TortoiseProc /command:commit /path:"C:\pmtk3"');
```

  * SVN Log
```
system('TortoiseProc /command:log /path:"C:\pmtk3"');
```

  * SVN Diff
```
edhandle = com.mathworks.mlservices.MLEditorServices;
currentdoc = char(edhandle.builtinGetActiveDocument);
system(sprintf('TortoiseProc /command:diff /path:"%s', currentdoc));
```

The SVN Diff shortcut displays the differences between the currently open working copy of a Matlab file and the repository version.

Also see this important note regarding [svn mime types](svnMimeTypes.md).