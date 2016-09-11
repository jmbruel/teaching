set UML=TD1.uml
set TYPE='PNG'
set DOCLETPATH=E:\IUT-S3\CPOA\TP1\SuperCanardBof
echo "Creating %UML%..."
rem javadoc -private -quiet -J-DdestinationFile=%UML% -J-DcreatePackages=false -J-DshowPublicMethods=true -J-DshowPublicConstructors=false -J-DshowPublicFields=true -doclet de.mallox.doclet.PlantUMLDoclet -docletpath %DOCLETPATH%\plantUmlDoclet.jar src\canard\*.java
echo "Done."

javadoc -J-DdestinationFile=%UML% -J-DcreatePackages=false -J-DshowPublicMethods=true -J-DshowPublicConstructors=false -J-DshowPublicFields=true -doclet de.mallox.doclet.PlantUMLDoclet -docletpath plantUmlDoclet.jar src\appli\*.java src\armes\*.java src\armes\impl\*.java

set TYPE='png'
echo "Converting %UML% to $TYPE..."
java -jar %DOCLETPATH%\plantuml.jar -config "%DOCLETPATH%\config.cfg" -t %TYPE% %UML%
echo "Done."