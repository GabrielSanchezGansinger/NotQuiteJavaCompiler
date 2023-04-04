

%vTable_Car = type {
     i32(%Car*)*  ; getHorsePower
    ,i32(%Car*)*  ; getWheelAmmount
}

%Car = type {
     %vTable_Car*  ; vTablePointer: Car
}

%vTable_Bicycle = type {
     i32(%Bicycle*)*  ; getWheelAmmount
}

%Bicycle = type {
     %vTable_Bicycle*  ; vTablePointer: Bicycle
}

@vTable_Car1 = constant %vTable_Car  {
    i32(%Car*)* @getHorsePower,
    i32(%Car*)* @getWheelAmmount
}


@vTable_Bicycle1 = constant %vTable_Bicycle  {
    i32(%Bicycle*)* @getWheelAmmount1
}


define i32 @getHorsePower(%Car* %this) {
initMethod:
    ;11 start statement : {
    ;12 start statement : return 50;
    ret i32 50
    

}

define i32 @getWheelAmmount(%Car* %this) {
initMethod:
    ;14 start statement : {
    ;15 start statement : return 4;
    ret i32 4
    

}

define i32 @getWheelAmmount1(%Bicycle* %this) {
initMethod:
    ;20 start statement : {
    ;21 start statement : return 2;
    ret i32 2
    

}

define %Car* @"Create Car"() {
"Constr class Car":
    %"struct Car" = call i8* @malloc(i32 ptrtoint (%Car* getelementptr (%Car, %Car* null, i32 1) to i32))
    %"classPointer Car" = bitcast i8* %"struct Car" to %Car*
    %ffAdress = getelementptr %Car, %Car* %"classPointer Car", i32 0, i32 0
    store %vTable_Car* @vTable_Car1, %vTable_Car** %ffAdress
    ret %Car* %"classPointer Car"
    

}

define %Bicycle* @"Create Bicycle"() {
"Constr class Bicycle":
    %"struct Bicycle" = call i8* @malloc(i32 ptrtoint (%Bicycle* getelementptr (%Bicycle, %Bicycle* null, i32 1) to i32))
    %"classPointer Bicycle" = bitcast i8* %"struct Bicycle" to %Bicycle*
    %ffAdress = getelementptr %Bicycle, %Bicycle* %"classPointer Bicycle", i32 0, i32 0
    store %vTable_Bicycle* @vTable_Bicycle1, %vTable_Bicycle** %ffAdress
    ret %Bicycle* %"classPointer Bicycle"
    

}

define i32 @main() {
init:
    %res = alloca i32
    %a = alloca %Car*
    ;26 start statement : {
    ;27 start statement : int res
    ;27 end statement: int res
    ;29 start statement : Vehicle a
    ;29 end statement: Vehicle a
    ;30 start statement : a = new Car();
    %constrRes = call %Car* @"Create Car"()
    store %Car* %constrRes, %Car** %a
    ;30 end statement: a = new Car();
    ;31 start statement : res = a.getWheelAmmount();
    %t = load %Car*, %Car** %a
    %vTablePointer = getelementptr %Car, %Car* %t, i32 0, i32 0
    %vTablePoint = load %vTable_Car*, %vTable_Car** %vTablePointer
    %procedurePointer = getelementptr %vTable_Car, %vTable_Car* %vTablePoint, i32 0, i32 1
    %loadedProcedure = load i32(%Car*)*, i32(%Car*)** %procedurePointer
    %getWheelAmmount_result = call i32 %loadedProcedure(%Car* %t)
    store i32 %getWheelAmmount_result, i32* %res
    ;31 end statement: res = a.getWheelAmmount();
    ;32 start statement : printInt(res);
    %t1 = load i32, i32* %res
    call void @print(i32 %t1)
    ;32 end statement: printInt(res);
    ;34 start statement : a = new Bicycle();
    %constrRes1 = call %Bicycle* @"Create Bicycle"()
    %castValue = bitcast %Bicycle* %constrRes1 to %Car*
    store %Car* %castValue, %Car** %a
    ;34 end statement: a = new Bicycle();
    ;35 start statement : res = a.getWheelAmmount();
    %t2 = load %Car*, %Car** %a
    %vTablePointer1 = getelementptr %Car, %Car* %t2, i32 0, i32 0
    %vTablePoint1 = load %vTable_Car*, %vTable_Car** %vTablePointer1
    %procedurePointer1 = getelementptr %vTable_Car, %vTable_Car* %vTablePoint1, i32 0, i32 1
    %loadedProcedure1 = load i32(%Car*)*, i32(%Car*)** %procedurePointer1
    %getWheelAmmount_result1 = call i32 %loadedProcedure1(%Car* %t2)
    store i32 %getWheelAmmount_result1, i32* %res
    ;35 end statement: res = a.getWheelAmmount();
    ;36 start statement : printInt(res);
    %t3 = load i32, i32* %res
    call void @print(i32 %t3)
    ;36 end statement: printInt(res);
    ;37 start statement : return 0;
    ret i32 0
    

}


declare noalias i8* @malloc(i32)

declare i32 @printf(i8*, ...)

declare void @exit(i32)

@.printstr = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
define void @print(i32 %i) {
    %temp = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.printstr, i32 0, i32 0), i32 %i)
    ret void
}
