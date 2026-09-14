-module(calculator).
-export([start_server/0, server/0]).

%Server Process
server() ->
    process_flag(trap_exit, true),
    server([]).
server(Number_List) ->
    io:format("Response from server~n", []),
    user_interfase(Number_List),
    Confirmation = string:trim(io:get_line("Do you want to make other operation (Y/N): ")),
    Validated_Confirmation = confirmation_validation(Confirmation),
    if
        Validated_Confirmation == "Y" ->
            io:format("OK~n", []),
            server(Number_List);
        Validated_Confirmation == "N" ->
            io:format("OK See you lather, have a good day :)~n", [])
    end.

%The principal interfase that the user will use
user_interfase(List) ->
    io:format("Only for the consideration, the numbers mut be in the following format 1.0, there must be a decimal always~n", []),
    Number1 = string:trim(io:get_line("Enter a number: ")),
    Validated_Number1 = confirmation_number(Number1),
    New_List1 = [Validated_Number1 | List],
    Number2 = string:trim(io:get_line("Enter a number: ")),
    Validated_Number2 = confirmation_number(Number2),
    New_List2 = [Validated_Number2 | New_List1],
    Confirmation = string:trim(io:get_line("Do you want add other number to the operation (Y/N): ")),
    Validated_Confirmation = confirmation_validation(Confirmation),
    Final_List = more_numbers(Validated_Confirmation, New_List2),
    io:format("Received numbers ~p~n", [Final_List]),
    operation_selector(Final_List).

%Functions for make a previus action 
more_numbers(Confirmation, List) ->
    if
        Confirmation == "Y" ->
            io:format("OK~n", []),
            Extra_Number = string:trim(io:get_line("Enter a number: ")),
            Validated_Extra_Number = confirmation_number(Extra_Number),
            New_List = [Validated_Extra_Number | List],
            New_Confirmation = string:trim(io:get_line("Do you want add other number to the operation (Y/N): ")),
            Validated_Confirmation = confirmation_validation(New_Confirmation),
            more_numbers(Validated_Confirmation, New_List);
        Confirmation == "N" ->
            io:format("OK~n", []),
            List
    end.

more_operations(Confirmation, List) ->
    if
        Confirmation == "Y" ->
            io:format("OK~n", []),
            io:format("Received numbers ~p~n", [List]),
            operation_selector(List);
        Confirmation == "N" ->
            io:format("OK~n", [])
    end.

%Process for call the operations
operation_selector(List) ->
    io:format("Take consideration that the operantions will be of the following way, if the operation is sum and the list is A, B, C, the program will first do A + B and them the result + C, that is the order whit each operation ~n", []),
    Operation = string:trim(io:get_line("Enter the simbol of the operation that you want to fulfill (Sum = +, Subtraction = -, Multiplication = *, Division = /): ")),
    Validated_Operation = confirmation_operation(Operation),
    Pid = spawn(fun() -> operations() end),
    sender(Pid, List, Validated_Operation).

%Operation process
operations() ->
    receive
        {List, "+"} ->
            [First | Rest] = List,
            Result = lists:foldl(fun sum/2, First, Rest),
            io:format("The sum result is: ~p~n", [Result]),
            Confirmation = string:trim(io:get_line("Do you want to do another operation with the same list (Y/N): ")),
            Validated_Confirmation = confirmation_validation(Confirmation),
            more_operations(Validated_Confirmation, List);
        {List, "-"} ->
            [First | Rest] = List,
            Result = lists:foldl(fun subtraction/2, First, Rest),
            io:format("The subtraction result is: ~p~n", [Result]),
            Confirmation = string:trim(io:get_line("Do you want to do another operation with the same list (Y/N): ")),
            Validated_Confirmation = confirmation_validation(Confirmation),
            more_operations(Validated_Confirmation, List);
        {List, "*"} ->
            [First | Rest] = List,
            Result = lists:foldl(fun multiplication/2, First, Rest),
            io:format("The multiplication result is: ~p~n", [Result]),
            Confirmation = string:trim(io:get_line("Do you want to do another operation with the same list (Y/N): ")),
            Validated_Confirmation = confirmation_validation(Confirmation),
            more_operations(Validated_Confirmation, List);
        {List, "/"} ->
            [First | Rest] = List,
            Result = lists:foldl(fun division/2, First, Rest),
            io:format("The division result is: ~p~n", [Result]),
            Confirmation = string:trim(io:get_line("Do you want to do another operation with the same list (Y/N): ")),
            Validated_Confirmation = confirmation_validation(Confirmation),
            more_operations(Validated_Confirmation, List)
    end.

%Operations
sum(Number1, Number2)->
    Product = Number1 + Number2.
subtraction(Number1, Number2)->
    Product = Number2 - Number1.
multiplication(Number1, Number2)->
    Product = Number1 * Number2.
division(Number1, Number2)->
    Product = Number2 / Number1.

%Verification functions for comfirmation of the correct imput
confirmation_number(Number) ->
    case string:to_float(Number) of
        {_Float, []} -> Number_Validated = list_to_float(Number);
        _ -> New_Number = string:trim(io:get_line("Pleace you must enter a number with decimal format, like this 1.2: ")),
        confirmation_number(New_Number)
    end.

confirmation_validation(Confirmation) ->
    if
        Confirmation =/= "Y" andalso Confirmation =/= "N" ->
            New_Confirmation = string:trim(io:get_line("Pleace you must enter (Y/N): ")),
            confirmation_validation(New_Confirmation);
        true ->
            Confirmation
    end.

confirmation_operation(Operation) ->
    if
        Operation =/= "+" andalso Operation =/= "-" andalso Operation =/= "*" andalso Operation =/= "/" ->
            New_Operation = string:trim(io:get_line("Pleace you must enter ( + , - , * or / ): ")),
            confirmation_operation(New_Operation);
        true ->
            Operation
    end.

%The sender function
sender(Pid, List, Operation) ->
    Pid ! {List, Operation}.

%Start the server
start_server() ->
    server().