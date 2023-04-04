

%vTable_C = type {
     i32(%C*)*  ; num
    ,i32(%C*)*  ; b
}

%C = type {
     %vTable_C*  ; vTablePointer: C
}

%vTable_D = type {
     i32(%D*)*  ; num
}

%D = type {
     %vTable_D*  ; vTablePointer: D
}

@vTable_C1 = constant %vTable_C  {
    i32(%C*)* @num,
    i32(%C*)* @b
}


@vTable_D1 = constant %vTable_D  {
    i32(%D*)* @num1
}


define i32 @num(%C* %this) {
initMethod:
    ;26 start statement : {
    ;27 start statement : return 1;
    ret i32 1
    

}

define i32 @b(%C* %this) {
initMethod:
    ;29 start statement : {
    ;30 start statement : return 69;
    ret i32 69
    

}

define i32 @num1(%D* %this) {
initMethod:
    ;36 start statement : {
    ;37 start statement : return 2;
    ret i32 2
    

}

define %C* @"Create C"() {
"Constr class C":
    %"struct C" = call i8* @malloc(i32 ptrtoint (%C* getelementptr (%C, %C* null, i32 1) to i32))
    %"classPointer C" = bitcast i8* %"struct C" to %C*
    %ffAdress = getelementptr %C, %C* %"classPointer C", i32 0, i32 0
    store %vTable_C* @vTable_C1, %vTable_C** %ffAdress
    ret %C* %"classPointer C"
    

}

define %D* @"Create D"() {
"Constr class D":
    %"struct D" = call i8* @malloc(i32 ptrtoint (%D* getelementptr (%D, %D* null, i32 1) to i32))
    %"classPointer D" = bitcast i8* %"struct D" to %D*
    %ffAdress = getelementptr %D, %D* %"classPointer D", i32 0, i32 0
    store %vTable_D* @vTable_D1, %vTable_D** %ffAdress
    ret %D* %"classPointer D"
    

}

define i32 @main() {
init:
    %res = alloca i32
    %a = alloca %C*
    ;1 start statement : {
    ;2 start statement : int res
    ;2 end statement: int res
    ;3 start statement : A a
    ;3 end statement: A a
    ;5 start statement : a = new C();
    %constrRes = call %C* @"Create C"()
    store %C* %constrRes, %C** %a
    ;5 end statement: a = new C();
    ;6 start statement : res = a.num();
    %t = load %C*, %C** %a
    %vTablePointer = getelementptr %C, %C* %t, i32 0, i32 0
    %vTablePoint = load %vTable_C*, %vTable_C** %vTablePointer
    %procedurePointer = getelementptr %vTable_C, %vTable_C* %vTablePoint, i32 0, i32 0
    %loadedProcedure = load i32(%C*)*, i32(%C*)** %procedurePointer
    %num_result = call i32 %loadedProcedure(%C* %t)
    store i32 %num_result, i32* %res
    ;6 end statement: res = a.num();
    ;7 start statement : printInt(res);
    %t1 = load i32, i32* %res
    call void @print(i32 %t1)
    ;7 end statement: printInt(res);
    ;9 start statement : a = new D();
    %constrRes1 = call %D* @"Create D"()
    %castValue = bitcast %D* %constrRes1 to %C*
    store %C* %castValue, %C** %a
    ;9 end statement: a = new D();
    ;10 start statement : res = a.num();
    %t2 = load %C*, %C** %a
    %vTablePointer1 = getelementptr %C, %C* %t2, i32 0, i32 0
    %vTablePoint1 = load %vTable_C*, %vTable_C** %vTablePointer1
    %procedurePointer1 = getelementptr %vTable_C, %vTable_C* %vTablePoint1, i32 0, i32 0
    %loadedProcedure1 = load i32(%C*)*, i32(%C*)** %procedurePointer1
    %num_result1 = call i32 %loadedProcedure1(%C* %t2)
    store i32 %num_result1, i32* %res
    ;10 end statement: res = a.num();
    ;11 start statement : printInt(res);
    %t3 = load i32, i32* %res
    call void @print(i32 %t3)
    ;11 end statement: printInt(res);
    ;13 start statement : return 0;
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
