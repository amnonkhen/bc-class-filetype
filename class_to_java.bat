rem assumes:
rem 1) java is installed - set JAVA_HOME
rem 2) FernFlower decompiler is installed set FERNFLOWER_HOME

echo %DATE% %TIME% decompile %1 > decompile.log
echo %DATE% %TIME% args: %0 %1 %2 %3 %4 %5 %6 >> decompile.log
set CLASS_NAME=%~n1
set JAVA_FILE=%CLASS_NAME%.java
echo 
set JAVA_HOME=c:\Program Files\Java\jdk1.8.0_25
set FERNFLOWER_HOME=C:\Program Files (x86)\JetBrains\IntelliJ IDEA 2016.3.1\plugins\java-decompiler\lib
echo %DATE% %TIME% args: running decompiler >> decompile.log
"%JAVA_HOME%\bin\java" -cp "%FERNFLOWER_HOME%\java-decompiler.jar" org.jetbrains.java.decompiler.main.decompiler.ConsoleDecompiler "%1" . 2>> decompile.log
echo %DATE% %TIME% args: copying output %JAVA_FILE% >> decompile.log
copy /y "%JAVA_FILE%" "%2" >> decompile.log
rem Helpers\Java\jad.exe -p %1 > %2 2>> decompile.log
