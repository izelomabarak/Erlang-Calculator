# Overview

{Important!  Do not say in this section that this is college assignment.  Talk about what you are trying to accomplish as a software engineer to further your learning.}

{Provide a description for the software that you wrote to demonstrate the Erlang language.}
**Is a functional calculator that performs basic arithmetic operations (+, -, x, /), the program have a displaying using format, patter marching in the functions parameters, recursion, guards, lists and the lambda function named lists:foldl and created a prosses y send messages to that process, the software have firts a server_start function that is called in the consol and this function start all the principal process called server, server process call another process called user_interfase, in this process is displayed the text that will be use like imput and store this imput in a list, this function have spaces to call a process called more_numbers, that is used for add more that 2 number to the list, also at the end call the operation_selector process for select the wanted operation, this procces afther recive the ifromation of what operation must be completed send a message to the operations process and this proces recive this message and guive the result of the operation, here the proces guive the posibility to make another operation whit the same list, afther this the operation_selector end and becase of this also the user_interfase end making get back to the sever proces were the user selects if he wmats to make another operation or end the process, also afther each input of information exist a confirmation process, were is determinated that the imput have the correct format(in case of the numbers) of have the correct imput(in case of the operations and questions Y/N), also theres short functions that make the operations and this functions are called by the operations process.**

{Describe your purpose for writing this software.}
**I write this software becase I fell that will be a perfect situation for put in practice the general conceps of Erlang, in this software in test and make use of almost ecah characterstic of Erlang in a way and another, this software help me alot for put the concepst of erlang in practice and make use of them to solve a real problem and increasy my ability to program and undertand Erlang lenguage**

{Provide a link to your YouTube demonstration.  It should be a 4-5 minute demo of the software running and a walkthrough of the code.  Focus should be on sharing what you learned about the language syntax.}

[Software Demo Video](https://youtu.be/U7CjSQ896Gk)

# Development Environment

{Describe the tools that you used to develop the software}
**I use the VS Code to writhe the full code, I also intall Erlang for run the erlang code and in VS Code I intall the Erlnag module ofr code whit more tolls in VS Code, whit this programs I can program and run code in Erlang.**

{Describe the programming language that you used and any libraries.}
**Erlang is a program principali use in telecomunications, is extremly helfull becase has the capability of run multiple process at the same time, I use the standar Erlang functinalities, some examples were the creation of procces, the use of build in functionalities like spawn and the use of tolls like io for display text and recive imput and lists:foldl for interact whit list.** 

# Useful Websites

{Make a list of websites that you found helpful in this project}
* [Erlang](https://www.erlang.org/doc/readme.html)
* [Tutorial Erlang](https://ferestrepoca.github.io/paradigmas-de-programacion/progconcurrente/tutoriales/erlang/Erlang.html)

# Future Work

{Make a list of things that you need to fix, improve, and add in the future.}
* **I cand add the obtion and the functions to use exponentiation and square root operations**
* **I can add a way to store the result of the operation and guive the oportunity to use that element for the next number list**
* **Add a way of add or delete numbers of the list during the operations**