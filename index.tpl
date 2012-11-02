<?xml version="1.0" encoding="utf-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="generator" content="Docutils 0.9.1: http://docutils.sourceforge.net/" />
<title>bottlepaste</title>
<style type="text/css">

/*

:bottlepaste.css:
:Author: Valentin Haenel

Heavily based on voidspace, by:

:Authors: Ian Bicking, Michael Foord
:Contact: fuzzyman@voidspace.org.uk
:Date: 2005/08/26 
:Version: 0.1.0
:Copyright: This stylesheet has been placed in the public domain.

Stylesheet for Docutils.
Based on ``blue_box.css`` by Ian Bicking
and ``html4css1.css`` revision 1.46.
*/

@import url(html4css1.css);

body {
  font-family: Arial, sans-serif;
  width: 950px;
  margin: 1em auto .5em;
  padding: 10px;
  color: #222;
  background-color:#F6EB9B;
  border: medium solid #444; 
  border-radius: 20px;
  -moz-border-radius: 20px;
}

em, i {
  /* Typically serif fonts have much nicer italics */
  font-family: Times New Roman, Times, serif;
}

a.target {
  color: blue;
}

a.target {
  color: blue;
}

a.toc-backref {
  text-decoration: none;
  color: #444;
}

a.toc-backref:hover {
  background-color: inherit;
}

a:hover {
  background-color: #cccccc;
}

div.attention, div.caution, div.danger, div.error, div.hint,
div.important, div.note, div.tip, div.warning {
  background-color: #cccccc;
  padding: 3px;
  width: 80%;
}

div.admonition p.admonition-title, div.hint p.admonition-title,
div.important p.admonition-title, div.note p.admonition-title,
div.tip p.admonition-title  {
  text-align: center;
  background-color: #999999;
  display: block;
  margin: 0;
}

div.attention p.admonition-title, div.caution p.admonition-title,
div.danger p.admonition-title, div.error p.admonition-title,
div.warning p.admonition-title {
  color: #cc0000;
  font-family: sans-serif;
  text-align: center;
  background-color: #999999;
  display: block;
  margin: 0;
}

h1, h2, h3, h4, h5, h6 {
  font-family: Helvetica, Arial, sans-serif;
  /* This makes the borders rounded on Mozilla, which pleases me */
}

h1 {
  color: #444;
  font-size: 150%;
}


h3, h4, h5, h6 {
  background-color: #cccccc;
  color: #000000;
}

h3 a.toc-backref, h4 a.toc-backref, h5 a.toc-backref, 
h6 a.toc-backref { 
  color: #000000;
}

h1.title {
  text-align: center;
  background-color: #666699;
  color: #cfcfcf;
  border: thick solid #444;
  border-radius: 20px;
  -moz-border-radius: 20px;
  font-size: 200%;
}

table.footnote {
  padding-left: 0.5ex;
  text-align: center;
}

table.citation {
  padding-left: 0.5ex
}

pre.literal-block, pre.doctest-block {
  border: thin #444 solid;
  background-color: #cfcfcf;
  border-radius: 5px;
  -moz-border-radius: 5px;
  padding: 5px;
}

.image img { border-style : solid;
            border-width : 2px;
}

h1 tt, h2 tt, h3 tt, h4 tt, h5 tt, h6 tt {
  font-size: 100%;
}

code, tt {
  color: #272727;
  background-color: #cfcfcf;
  border: thin #444 solid;
  border-radius: 5px;
  -moz-border-radius: 5px;
}

div.footer {
  text-align: center;
  background-color: #666699;
  color: #cfcfcf;
  border: thick solid #444;
  border-radius: 20px;
  -moz-border-radius: 20px;
}

hr.footer {
  border: 0;
  height:0;
}

a, a:active, a:visited {
    color: #666699;
    text-decoration: none;
}
a:hover {
    color: #cfcfcf;
    background-color: #666699;
    border-radius: 5px;
    -moz-border-radius: 5px;
}
ul { list-style: none }
li:before { content: "\00BB \0020"; font-weight:bold }

</style>
<style type="text/css">

.hll { background-color: #ffffcc }
.c { color: #999988; font-style: italic } /* Comment */
.err { color: #a61717; background-color: #e3d2d2 } /* Error */
.k { color: #000000; font-weight: bold } /* Keyword */
.o { color: #000000; font-weight: bold } /* Operator */
.cm { color: #999988; font-style: italic } /* Comment.Multiline */
.cp { color: #999999; font-weight: bold; font-style: italic } /* Comment.Preproc */
.c1 { color: #999988; font-style: italic } /* Comment.Single */
.cs { color: #999999; font-weight: bold; font-style: italic } /* Comment.Special */
.gd { color: #000000; background-color: #ffdddd } /* Generic.Deleted */
.ge { color: #000000; font-style: italic } /* Generic.Emph */
.gr { color: #aa0000 } /* Generic.Error */
.gh { color: #999999 } /* Generic.Heading */
.gi { color: #000000; background-color: #ddffdd } /* Generic.Inserted */
.go { color: #888888 } /* Generic.Output */
.gp { color: #555555 } /* Generic.Prompt */
.gs { font-weight: bold } /* Generic.Strong */
.gu { color: #aaaaaa } /* Generic.Subheading */
.gt { color: #aa0000 } /* Generic.Traceback */
.kc { color: #000000; font-weight: bold } /* Keyword.Constant */
.kd { color: #000000; font-weight: bold } /* Keyword.Declaration */
.kn { color: #000000; font-weight: bold } /* Keyword.Namespace */
.kp { color: #000000; font-weight: bold } /* Keyword.Pseudo */
.kr { color: #000000; font-weight: bold } /* Keyword.Reserved */
.kt { color: #445588; font-weight: bold } /* Keyword.Type */
.m { color: #009999 } /* Literal.Number */
.s { color: #d01040 } /* Literal.String */
.na { color: #008080 } /* Name.Attribute */
.nb { color: #0086B3 } /* Name.Builtin */
.nc { color: #445588; font-weight: bold } /* Name.Class */
.no { color: #008080 } /* Name.Constant */
.nd { color: #3c5d5d; font-weight: bold } /* Name.Decorator */
.ni { color: #800080 } /* Name.Entity */
.ne { color: #990000; font-weight: bold } /* Name.Exception */
.nf { color: #990000; font-weight: bold } /* Name.Function */
.nl { color: #990000; font-weight: bold } /* Name.Label */
.nn { color: #555555 } /* Name.Namespace */
.nt { color: #000080 } /* Name.Tag */
.nv { color: #008080 } /* Name.Variable */
.ow { color: #000000; font-weight: bold } /* Operator.Word */
.w { color: #bbbbbb } /* Text.Whitespace */
.mf { color: #009999 } /* Literal.Number.Float */
.mh { color: #009999 } /* Literal.Number.Hex */
.mi { color: #009999 } /* Literal.Number.Integer */
.mo { color: #009999 } /* Literal.Number.Oct */
.sb { color: #d01040 } /* Literal.String.Backtick */
.sc { color: #d01040 } /* Literal.String.Char */
.sd { color: #d01040 } /* Literal.String.Doc */
.s2 { color: #d01040 } /* Literal.String.Double */
.se { color: #d01040 } /* Literal.String.Escape */
.sh { color: #d01040 } /* Literal.String.Heredoc */
.si { color: #d01040 } /* Literal.String.Interpol */
.sx { color: #d01040 } /* Literal.String.Other */
.sr { color: #009926 } /* Literal.String.Regex */
.s1 { color: #d01040 } /* Literal.String.Single */
.ss { color: #990073 } /* Literal.String.Symbol */
.bp { color: #999999 } /* Name.Builtin.Pseudo */
.vc { color: #008080 } /* Name.Variable.Class */
.vg { color: #008080 } /* Name.Variable.Global */
.vi { color: #008080 } /* Name.Variable.Instance */
.il { color: #009999 } /* Literal.Number.Integer.Long */

</style>
</head>
<body>
<div class="document" id="bottlepaste">
<h1 class="title">bottlepaste</h1>

<p>A command line pastebin akin to <a class="reference external" href="http://sprunge.us/">sprunge.us</a> but using
<a class="reference external" href="http://bottlepy.org/">bottle.py</a> as webframework and
<a class="reference external" href="http://www.mongodb.org/">MongoDB</a> via <a class="reference external" href="http://api.mongodb.org/python/current/">PyMongo</a> as storage.</p>
<div class="section" id="synposis">
<h1>» Synposis</h1>
<pre class="code console literal-block">
<span class="gp">$</span> &lt;<span class="nb">command</span>&gt; | curl -F <span class="s1">'bp=&lt;-'</span> <span class="o">[</span>-F <span class="s1">'uid=&lt;uid&gt;'</span><span class="o">]</span> DEPLOYMENT_URL
</pre>
</div>
<div class="section" id="examples">
<h1>» Examples</h1>
<pre class="code console literal-block">
<span class="gp">#</span> Use curl to paste:
<span class="gp">$</span> cat bottlepaste.py | curl -F <span class="s1">'bp=&lt;-'</span> DEPLOYMENT_URL
<span class="go">DEPLOYMENT_URL/ec42eda</span>
</pre>
<pre class="code console literal-block">
<span class="gp">#</span> If you want a custom uid, use:
<span class="gp">$</span> cat bottlepaste.py | curl -F <span class="s1">'bp=&lt;-'</span> -F <span class="s1">'uid=bottlepaste.py'</span> DEPLOYMENT_URL
<span class="go">DEPLOYMENT_URL/bottlepaste.py</span>
</pre>
<p>The <tt class="docutils literal">uid</tt> paramter is subject to the following regex: <tt class="docutils literal"><span class="pre">'^[a-zA-Z0-9_\-\.]{3,23}$'</span></tt>.
Also some well knowen file names are dissallowed.</p>
<p>For convenience you can download the</p>
</div>
<div class="section" id="see-also">
<h1>» See also</h1>
<ul class="simple">
<li><a class="reference external" href="https://github.com/esc/bottlepaste">github repository</a></li>
</ul>
</div>
</div>
<div class="footer">
<hr class="footer" />
<strong>© 2012 Valentin Haenel -- proudly hosted on »</strong> <a class="reference external" href="https://www.cloudcontrol.com/">cloudControl</a>  <strong>«</strong>
</div>
</body>
</html>
