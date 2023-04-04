

%vTable_Banana = type {
     i32(%Banana*)*  ; getColorHue
    ,i32(%Banana*)*  ; getAmmountOfCalories
}

%Banana = type {
     %vTable_Banana*  ; vTablePointer: Banana
}

%vTable_Apple = type {
     i32(%Apple*)*  ; getColorHue
    ,i32(%Apple*)*  ; getAmmountOfCalories
}

%Apple = type {
     %vTable_Apple*  ; vTablePointer: Apple
}

@vTable_Banana1 = constant %vTable_Banana  {
    i32(%Banana*)* @getColorHue,
    i32(%Banana*)* @getAmmountOfCalories
}


@vTable_Apple1 = constant %vTable_Apple  {
    i32(%Apple*)* @getColorHue1,
    i32(%Apple*)* @getAmmountOfCalories1
}


define i32 @getColorHue(%Banana* %this) {
initMethod:
    ;26 start statement : {
    ;27 start statement : return 56;
    ret i32 56
    

}

define i32 @getAmmountOfCalories(%Banana* %this) {
initMethod:
    ;30 start statement : {
    ;31 start statement : return 89;
    ret i32 89
    

}

define i32 @getColorHue1(%Apple* %this) {
initMethod:
    ;36 start statement : {
    ;37 start statement : return 360;
    ret i32 360
    

}

define i32 @getAmmountOfCalories1(%Apple* %this) {
initMethod:
    ;40 start statement : {
    ;41 start statement : return 52;
    ret i32 52
    

}

define %Banana* @"Create Banana"() {
"Constr class Banana":
    %"struct Banana" = call i8* @malloc(i32 ptrtoint (%Banana* getelementptr (%Banana, %Banana* null, i32 1) to i32))
    %"classPointer Banana" = bitcast i8* %"struct Banana" to %Banana*
    %ffAdress = getelementptr %Banana, %Banana* %"classPointer Banana", i32 0, i32 0
    store %vTable_Banana* @vTable_Banana1, %vTable_Banana** %ffAdress
    ret %Banana* %"classPointer Banana"
    

}

define %Apple* @"Create Apple"() {
"Constr class Apple":
    %"struct Apple" = call i8* @malloc(i32 ptrtoint (%Apple* getelementptr (%Apple, %Apple* null, i32 1) to i32))
    %"classPointer Apple" = bitcast i8* %"struct Apple" to %Apple*
    %ffAdress = getelementptr %Apple, %Apple* %"classPointer Apple", i32 0, i32 0
    store %vTable_Apple* @vTable_Apple1, %vTable_Apple** %ffAdress
    ret %Apple* %"classPointer Apple"
    

}

define i1 @healthy(%Banana* %f) {
init:
    %f1 = alloca %Banana*
    store %Banana* %f, %Banana** %f1
    ;45 start statement : {
    ;46 start statement : if ((f.getAmmountOfCalories() < 60)) return true;
    %t = load %Banana*, %Banana** %f1
    %vTablePointer = getelementptr %Banana, %Banana* %t, i32 0, i32 0
    %vTablePoint = load %vTable_Banana*, %vTable_Banana** %vTablePointer
    %procedurePointer = getelementptr %vTable_Banana, %vTable_Banana* %vTablePoint, i32 0, i32 1
    %loadedProcedure = load i32(%Banana*)*, i32(%Banana*)** %procedurePointer
    %getAmmountOfCalories_result = call i32 %loadedProcedure(%Banana* %t)
    %resSltImpl = icmp slt i32 %getAmmountOfCalories_result, 60
    br i1 %resSltImpl, label %ifTrue, label %ifFalse
    
ifTrue:
    ;47 start statement : return true;
    ret i1 1
    
ifFalse:
    ;49 start statement : return false;
    ret i1 0
    
endif:
    ;46 end statement: if ((f.getAmmountOfCalories() < 60)) return true;
    ;50 start statement : return false;
    ret i1 0
    

}

define i32 @main() {
init:
    %res = alloca i1
    %app = alloca %Apple*
    %ban = alloca %Banana*
    ;1 start statement : {
    ;2 start statement : boolean res
    ;2 end statement: boolean res
    ;3 start statement : Apple app
    ;3 end statement: Apple app
    ;4 start statement : app = new Apple();
    %constrRes = call %Apple* @"Create Apple"()
    store %Apple* %constrRes, %Apple** %app
    ;4 end statement: app = new Apple();
    ;5 start statement : healthy(app);
    %t = load %Apple*, %Apple** %app
    %castValue = bitcast %Apple* %t to %Banana*
    %healthy_result = call i1 @healthy(%Banana* %castValue)
    ;5 end statement: healthy(app);
    ;8 start statement : Fruit ban
    ;8 end statement: Fruit ban
    ;9 start statement : ban = new Banana();
    %constrRes1 = call %Banana* @"Create Banana"()
    store %Banana* %constrRes1, %Banana** %ban
    ;9 end statement: ban = new Banana();
    ;10 start statement : res = healthy(ban);
    %t1 = load %Banana*, %Banana** %ban
    %healthy_result1 = call i1 @healthy(%Banana* %t1)
    store i1 %healthy_result1, i1* %res
    ;10 end statement: res = healthy(ban);
    ;11 start statement : if ((res == false)) printInt(1);
    %t2 = load i1, i1* %res
    %resEqImpl = icmp eq i1 %t2, 0
    br i1 %resEqImpl, label %ifTrue, label %ifFalse
    
ifTrue:
    ;12 start statement : printInt(1);
    call void @print(i32 1)
    ;12 end statement: printInt(1);
    br label %endif
    
ifFalse:
    ;14 start statement : printInt(0);
    call void @print(i32 0)
    ;14 end statement: printInt(0);
    br label %endif
    
endif:
    ;11 end statement: if ((res == false)) printInt(1);
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
