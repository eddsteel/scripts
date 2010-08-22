#!/bin/bash
# run-project.sh -- created 07/03/2007, Edward Steel
# @Last Change: 24-Dez-2004.
# @Revision:    0.0
java="/usr/lib/jvm/java-1.4.2-gcj-4.1-1.4.2.0/bin/java"

cd ~/Projects/3rd-Year-Project/code

$java -cp jar/aitchbee.jar:lib/batik-awt-util.jar:lib/batik-css.jar:lib/batik-dom.jar:lib/batik-ext.jar:lib/batik-gui-util.jar:lib/batik-gvt.jar:lib/batik-parser.jar:lib/batik-svg-dom.jar:lib/batik-svggen.jar:lib/batik-util.jar:lib/batik-xml.jar:lib/j2d4swt-2.3.0.jar:lib/swt3.2-gtk.jar:lib/swt-gtk.jar:lib/swt.jar -Djava.library.path=lib aitchbee.sketch.view.StrokeTester $*
