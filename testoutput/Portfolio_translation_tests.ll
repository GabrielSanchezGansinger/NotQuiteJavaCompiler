

%vTable_B = type {
     i32(%B*)*  ; helloWorld
}

%B = type {
     %vTable_B*  ; vTablePointer: B
}

@vTable_B1 = constant %vTable_B  {
    i32(%B*)* @helloWorld
}


define i32 @helloWorld(%B* %this) {
initMethod:
    ;6 start statement : {
    ;7 start statement : return 1;
    ret i32 1
    

}

define %B* @"Create B"() {
"Constr class B":
    %"struct B" = call i8* @malloc(i32 ptrtoint (%B* getelementptr (%B, %B* null, i32 1) to i32))
    %"classPointer B" = bitcast i8* %"struct B" to %B*
    %ffAdress = getelementptr %B, %B* %"classPointer B", i32 0, i32 0
    store %vTable_B* @vTable_B1, %vTable_B** %ffAdress
    ret %B* %"classPointer B"
    

}

define i32 @test() {
init:
    ;19 start statement : {
    ;20 start statement : printInt(1);
    call void @print(i32 1)
    ;20 end statement: printInt(1);
    ;21 start statement : return 1;
    ret i32 1
    

}

define i32 @main() {
init:
    %b = alloca %B*
    ;11 start statement : {
    ;12 start statement : B b
    ;12 end statement: B b
    ;13 start statement : b = new B();
    %constrRes = call %B* @"Create B"()
    store %B* %constrRes, %B** %b
    ;13 end statement: b = new B();
    ;14 start statement : b.helloWorld();
    %t = load %B*, %B** %b
    %vTablePointer = getelementptr %B, %B* %t, i32 0, i32 0
    %vTablePoint = load %vTable_B*, %vTable_B** %vTablePointer
    %procedurePointer = getelementptr %vTable_B, %vTable_B* %vTablePoint, i32 0, i32 0
    %loadedProcedure = load i32(%B*)*, i32(%B*)** %procedurePointer
    %helloWorld_result = call i32 %loadedProcedure(%B* %t)
    ;14 end statement: b.helloWorld();
    ;15 start statement : test();
    %test_result = call i32 @test()
    ;15 end statement: test();
    ;16 start statement : return 0;
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
