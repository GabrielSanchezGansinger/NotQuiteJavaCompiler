

%vTable_A = type {
     i32(%A*)*  ; test1
    ,i32(%A*)*  ; test2
}

%A = type {
     %vTable_A*  ; vTablePointer: A
}

%vTable_B = type {
     i32(%B*)*  ; test1
    ,i32(%B*)*  ; test2
}

%B = type {
     %vTable_B*  ; vTablePointer: B
}

@vTable_A1 = constant %vTable_A  {
    i32(%A*)* @test1,
    i32(%A*)* @test2
}


@vTable_B1 = constant %vTable_B  {
    i32(%B*)* @test11,
    i32(%B*)* @test21
}


define i32 @test1(%A* %this) {
initMethod:
    ;21 start statement : {
    ;22 start statement : return 1;
    ret i32 1
    

}

define i32 @test2(%A* %this) {
initMethod:
    ;25 start statement : {
    ;26 start statement : return 2;
    ret i32 2
    

}

define i32 @test11(%B* %this) {
initMethod:
    ;31 start statement : {
    ;32 start statement : printInt(this.test2());
    %vTablePointer = getelementptr %B, %B* %this, i32 0, i32 0
    %vTablePoint = load %vTable_B*, %vTable_B** %vTablePointer
    %procedurePointer = getelementptr %vTable_B, %vTable_B* %vTablePoint, i32 0, i32 1
    %loadedProcedure = load i32(%B*)*, i32(%B*)** %procedurePointer
    %test2_result = call i32 %loadedProcedure(%B* %this)
    call void @print(i32 %test2_result)
    ;32 end statement: printInt(this.test2());
    ;33 start statement : return 10;
    ret i32 10
    

}

define i32 @test21(%B* %this) {
initMethod:
    ;36 start statement : {
    ;37 start statement : return 11;
    ret i32 11
    

}

define %A* @"Create A"() {
"Constr class A":
    %"struct A" = call i8* @malloc(i32 ptrtoint (%A* getelementptr (%A, %A* null, i32 1) to i32))
    %"classPointer A" = bitcast i8* %"struct A" to %A*
    %ffAdress = getelementptr %A, %A* %"classPointer A", i32 0, i32 0
    store %vTable_A* @vTable_A1, %vTable_A** %ffAdress
    ret %A* %"classPointer A"
    

}

define %B* @"Create B"() {
"Constr class B":
    %"struct B" = call i8* @malloc(i32 ptrtoint (%B* getelementptr (%B, %B* null, i32 1) to i32))
    %"classPointer B" = bitcast i8* %"struct B" to %B*
    %ffAdress = getelementptr %B, %B* %"classPointer B", i32 0, i32 0
    store %vTable_B* @vTable_B1, %vTable_B** %ffAdress
    ret %B* %"classPointer B"
    

}

define i32 @f(%A* %a) {
init:
    %a1 = alloca %A*
    store %A* %a, %A** %a1
    ;14 start statement : {
    ;15 start statement : printInt(a.test1());
    %t = load %A*, %A** %a1
    %vTablePointer = getelementptr %A, %A* %t, i32 0, i32 0
    %vTablePoint = load %vTable_A*, %vTable_A** %vTablePointer
    %procedurePointer = getelementptr %vTable_A, %vTable_A* %vTablePoint, i32 0, i32 0
    %loadedProcedure = load i32(%A*)*, i32(%A*)** %procedurePointer
    %test1_result = call i32 %loadedProcedure(%A* %t)
    call void @print(i32 %test1_result)
    ;15 end statement: printInt(a.test1());
    ;16 start statement : printInt(a.test2());
    %t1 = load %A*, %A** %a1
    %vTablePointer1 = getelementptr %A, %A* %t1, i32 0, i32 0
    %vTablePoint1 = load %vTable_A*, %vTable_A** %vTablePointer1
    %procedurePointer1 = getelementptr %vTable_A, %vTable_A* %vTablePoint1, i32 0, i32 1
    %loadedProcedure1 = load i32(%A*)*, i32(%A*)** %procedurePointer1
    %test2_result = call i32 %loadedProcedure1(%A* %t1)
    call void @print(i32 %test2_result)
    ;16 end statement: printInt(a.test2());
    ;17 start statement : return 0;
    ret i32 0
    

}

define i32 @main() {
init:
    %a = alloca %A*
    ;1 start statement : {
    ;2 start statement : I a
    ;2 end statement: I a
    ;3 start statement : a = new A();
    %constrRes = call %A* @"Create A"()
    store %A* %constrRes, %A** %a
    ;3 end statement: a = new A();
    ;4 start statement : printInt(a.test1());
    %t = load %A*, %A** %a
    %vTablePointer = getelementptr %A, %A* %t, i32 0, i32 0
    %vTablePoint = load %vTable_A*, %vTable_A** %vTablePointer
    %procedurePointer = getelementptr %vTable_A, %vTable_A* %vTablePoint, i32 0, i32 0
    %loadedProcedure = load i32(%A*)*, i32(%A*)** %procedurePointer
    %test1_result = call i32 %loadedProcedure(%A* %t)
    call void @print(i32 %test1_result)
    ;4 end statement: printInt(a.test1());
    ;5 start statement : printInt(a.test2());
    %t1 = load %A*, %A** %a
    %vTablePointer1 = getelementptr %A, %A* %t1, i32 0, i32 0
    %vTablePoint1 = load %vTable_A*, %vTable_A** %vTablePointer1
    %procedurePointer1 = getelementptr %vTable_A, %vTable_A* %vTablePoint1, i32 0, i32 1
    %loadedProcedure1 = load i32(%A*)*, i32(%A*)** %procedurePointer1
    %test2_result = call i32 %loadedProcedure1(%A* %t1)
    call void @print(i32 %test2_result)
    ;5 end statement: printInt(a.test2());
    ;6 start statement : f(a);
    %t2 = load %A*, %A** %a
    %f_result = call i32 @f(%A* %t2)
    ;6 end statement: f(a);
    ;7 start statement : a = new B();
    %constrRes1 = call %B* @"Create B"()
    %castValue = bitcast %B* %constrRes1 to %A*
    store %A* %castValue, %A** %a
    ;7 end statement: a = new B();
    ;8 start statement : f(a);
    %t3 = load %A*, %A** %a
    %f_result1 = call i32 @f(%A* %t3)
    ;8 end statement: f(a);
    ;9 start statement : printInt(a.test1());
    %t4 = load %A*, %A** %a
    %vTablePointer2 = getelementptr %A, %A* %t4, i32 0, i32 0
    %vTablePoint2 = load %vTable_A*, %vTable_A** %vTablePointer2
    %procedurePointer2 = getelementptr %vTable_A, %vTable_A* %vTablePoint2, i32 0, i32 0
    %loadedProcedure2 = load i32(%A*)*, i32(%A*)** %procedurePointer2
    %test1_result1 = call i32 %loadedProcedure2(%A* %t4)
    call void @print(i32 %test1_result1)
    ;9 end statement: printInt(a.test1());
    ;10 start statement : printInt(a.test2());
    %t5 = load %A*, %A** %a
    %vTablePointer3 = getelementptr %A, %A* %t5, i32 0, i32 0
    %vTablePoint3 = load %vTable_A*, %vTable_A** %vTablePointer3
    %procedurePointer3 = getelementptr %vTable_A, %vTable_A* %vTablePoint3, i32 0, i32 1
    %loadedProcedure3 = load i32(%A*)*, i32(%A*)** %procedurePointer3
    %test2_result1 = call i32 %loadedProcedure3(%A* %t5)
    call void @print(i32 %test2_result1)
    ;10 end statement: printInt(a.test2());
    ;11 start statement : return 0;
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
