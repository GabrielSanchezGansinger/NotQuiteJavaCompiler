@.print_message_1 = private unnamed_addr constant [33 x i8] c"Nullpointer exception in line 4\0A\00", align 1
@.print_message_2 = private unnamed_addr constant [37 x i8] c"Index out of bounds error in line 4\0A\00", align 1
@.print_message_3 = private unnamed_addr constant [33 x i8] c"Nullpointer exception in line 5\0A\00", align 1
@.print_message_4 = private unnamed_addr constant [37 x i8] c"Index out of bounds error in line 5\0A\00", align 1
@.print_message_5 = private unnamed_addr constant [33 x i8] c"Nullpointer exception in line 6\0A\00", align 1
@.print_message_6 = private unnamed_addr constant [37 x i8] c"Index out of bounds error in line 6\0A\00", align 1
@.print_message_7 = private unnamed_addr constant [33 x i8] c"Nullpointer exception in line 7\0A\00", align 1
@.print_message_8 = private unnamed_addr constant [37 x i8] c"Index out of bounds error in line 7\0A\00", align 1
@.print_message_9 = private unnamed_addr constant [33 x i8] c"Nullpointer exception in line 8\0A\00", align 1
@.print_message_10 = private unnamed_addr constant [37 x i8] c"Index out of bounds error in line 8\0A\00", align 1
@.print_message_11 = private unnamed_addr constant [33 x i8] c"Nullpointer exception in line 9\0A\00", align 1
@.print_message_12 = private unnamed_addr constant [37 x i8] c"Index out of bounds error in line 9\0A\00", align 1
@.print_message_13 = private unnamed_addr constant [34 x i8] c"Nullpointer exception in line 10\0A\00", align 1
@.print_message_14 = private unnamed_addr constant [38 x i8] c"Index out of bounds error in line 10\0A\00", align 1
@.print_message_15 = private unnamed_addr constant [29 x i8] c"Array Size must be positive\0A\00", align 1


%array_i32 = type {
     i32  ; length
    ,[0 x i32]  ; data
}

define i32 @main() {
init:
    %a1 = alloca %array_i32*
    ;1 start statement : {
    ;2 start statement : int[] a1
    ;2 end statement: int[] a1
    ;3 start statement : a1 = (new int[10]);
    %newArray1 = call %array_i32* @newArray(i32 10)
    store %array_i32* %newArray1, %array_i32** %a1
    ;3 end statement: a1 = (new int[10]);
    ;4 start statement : a1[0] = (1 * 1);
    %t = load %array_i32*, %array_i32** %a1
    %isNull = icmp eq %array_i32* %t, null
    br i1 %isNull, label %whenIsNull, label %notNull
    
whenIsNull:
    ; ERROR: Nullpointer exception in line 4
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.print_message_1, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull:
    %length_addr = getelementptr %array_i32, %array_i32* %t, i32 0, i32 0
    %len = load i32, i32* %length_addr
    %smallerZero = icmp slt i32 0, 0
    %lenMinusOne = sub i32 %len, 1
    %greaterEqualLen = icmp slt i32 %lenMinusOne, 0
    %outOfBounds = or i1 %smallerZero, %greaterEqualLen
    br i1 %outOfBounds, label %outOfBounds1, label %indexInRange
    
outOfBounds1:
    ; ERROR: Index out of bounds error in line 4
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.print_message_2, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange:
    %indexAddr = getelementptr %array_i32, %array_i32* %t, i32 0, i32 1, i32 0
    %resMulImpl = mul i32 1, 1
    store i32 %resMulImpl, i32* %indexAddr
    ;4 end statement: a1[0] = (1 * 1);
    ;5 start statement : a1[1] = (2 * 2);
    %t1 = load %array_i32*, %array_i32** %a1
    %isNull1 = icmp eq %array_i32* %t1, null
    br i1 %isNull1, label %whenIsNull1, label %notNull1
    
whenIsNull1:
    ; ERROR: Nullpointer exception in line 5
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.print_message_3, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull1:
    %length_addr1 = getelementptr %array_i32, %array_i32* %t1, i32 0, i32 0
    %len1 = load i32, i32* %length_addr1
    %smallerZero1 = icmp slt i32 1, 0
    %lenMinusOne1 = sub i32 %len1, 1
    %greaterEqualLen1 = icmp slt i32 %lenMinusOne1, 1
    %outOfBounds2 = or i1 %smallerZero1, %greaterEqualLen1
    br i1 %outOfBounds2, label %outOfBounds3, label %indexInRange1
    
outOfBounds3:
    ; ERROR: Index out of bounds error in line 5
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.print_message_4, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange1:
    %indexAddr1 = getelementptr %array_i32, %array_i32* %t1, i32 0, i32 1, i32 1
    %resMulImpl1 = mul i32 2, 2
    store i32 %resMulImpl1, i32* %indexAddr1
    ;5 end statement: a1[1] = (2 * 2);
    ;6 start statement : a1[9] = (9 * 9);
    %t2 = load %array_i32*, %array_i32** %a1
    %isNull2 = icmp eq %array_i32* %t2, null
    br i1 %isNull2, label %whenIsNull2, label %notNull2
    
whenIsNull2:
    ; ERROR: Nullpointer exception in line 6
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.print_message_5, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull2:
    %length_addr2 = getelementptr %array_i32, %array_i32* %t2, i32 0, i32 0
    %len2 = load i32, i32* %length_addr2
    %smallerZero2 = icmp slt i32 9, 0
    %lenMinusOne2 = sub i32 %len2, 1
    %greaterEqualLen2 = icmp slt i32 %lenMinusOne2, 9
    %outOfBounds4 = or i1 %smallerZero2, %greaterEqualLen2
    br i1 %outOfBounds4, label %outOfBounds5, label %indexInRange2
    
outOfBounds5:
    ; ERROR: Index out of bounds error in line 6
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.print_message_6, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange2:
    %indexAddr2 = getelementptr %array_i32, %array_i32* %t2, i32 0, i32 1, i32 9
    %resMulImpl2 = mul i32 9, 9
    store i32 %resMulImpl2, i32* %indexAddr2
    ;6 end statement: a1[9] = (9 * 9);
    ;7 start statement : printInt(a1[0]);
    %t3 = load %array_i32*, %array_i32** %a1
    %isNull3 = icmp eq %array_i32* %t3, null
    br i1 %isNull3, label %whenIsNull3, label %notNull3
    
whenIsNull3:
    ; ERROR: Nullpointer exception in line 7
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.print_message_7, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull3:
    %length_addr3 = getelementptr %array_i32, %array_i32* %t3, i32 0, i32 0
    %len3 = load i32, i32* %length_addr3
    %smallerZero3 = icmp slt i32 0, 0
    %lenMinusOne3 = sub i32 %len3, 1
    %greaterEqualLen3 = icmp slt i32 %lenMinusOne3, 0
    %outOfBounds6 = or i1 %smallerZero3, %greaterEqualLen3
    br i1 %outOfBounds6, label %outOfBounds7, label %indexInRange3
    
outOfBounds7:
    ; ERROR: Index out of bounds error in line 7
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.print_message_8, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange3:
    %indexAddr3 = getelementptr %array_i32, %array_i32* %t3, i32 0, i32 1, i32 0
    %t4 = load i32, i32* %indexAddr3
    call void @print(i32 %t4)
    ;7 end statement: printInt(a1[0]);
    ;8 start statement : printInt(a1[1]);
    %t5 = load %array_i32*, %array_i32** %a1
    %isNull4 = icmp eq %array_i32* %t5, null
    br i1 %isNull4, label %whenIsNull4, label %notNull4
    
whenIsNull4:
    ; ERROR: Nullpointer exception in line 8
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.print_message_9, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull4:
    %length_addr4 = getelementptr %array_i32, %array_i32* %t5, i32 0, i32 0
    %len4 = load i32, i32* %length_addr4
    %smallerZero4 = icmp slt i32 1, 0
    %lenMinusOne4 = sub i32 %len4, 1
    %greaterEqualLen4 = icmp slt i32 %lenMinusOne4, 1
    %outOfBounds8 = or i1 %smallerZero4, %greaterEqualLen4
    br i1 %outOfBounds8, label %outOfBounds9, label %indexInRange4
    
outOfBounds9:
    ; ERROR: Index out of bounds error in line 8
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.print_message_10, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange4:
    %indexAddr4 = getelementptr %array_i32, %array_i32* %t5, i32 0, i32 1, i32 1
    %t6 = load i32, i32* %indexAddr4
    call void @print(i32 %t6)
    ;8 end statement: printInt(a1[1]);
    ;9 start statement : printInt(a1[4]);
    %t7 = load %array_i32*, %array_i32** %a1
    %isNull5 = icmp eq %array_i32* %t7, null
    br i1 %isNull5, label %whenIsNull5, label %notNull5
    
whenIsNull5:
    ; ERROR: Nullpointer exception in line 9
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.print_message_11, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull5:
    %length_addr5 = getelementptr %array_i32, %array_i32* %t7, i32 0, i32 0
    %len5 = load i32, i32* %length_addr5
    %smallerZero5 = icmp slt i32 4, 0
    %lenMinusOne5 = sub i32 %len5, 1
    %greaterEqualLen5 = icmp slt i32 %lenMinusOne5, 4
    %outOfBounds10 = or i1 %smallerZero5, %greaterEqualLen5
    br i1 %outOfBounds10, label %outOfBounds11, label %indexInRange5
    
outOfBounds11:
    ; ERROR: Index out of bounds error in line 9
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.print_message_12, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange5:
    %indexAddr5 = getelementptr %array_i32, %array_i32* %t7, i32 0, i32 1, i32 4
    %t8 = load i32, i32* %indexAddr5
    call void @print(i32 %t8)
    ;9 end statement: printInt(a1[4]);
    ;10 start statement : printInt(a1[9]);
    %t9 = load %array_i32*, %array_i32** %a1
    %isNull6 = icmp eq %array_i32* %t9, null
    br i1 %isNull6, label %whenIsNull6, label %notNull6
    
whenIsNull6:
    ; ERROR: Nullpointer exception in line 10
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.print_message_13, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull6:
    %length_addr6 = getelementptr %array_i32, %array_i32* %t9, i32 0, i32 0
    %len6 = load i32, i32* %length_addr6
    %smallerZero6 = icmp slt i32 9, 0
    %lenMinusOne6 = sub i32 %len6, 1
    %greaterEqualLen6 = icmp slt i32 %lenMinusOne6, 9
    %outOfBounds12 = or i1 %smallerZero6, %greaterEqualLen6
    br i1 %outOfBounds12, label %outOfBounds13, label %indexInRange6
    
outOfBounds13:
    ; ERROR: Index out of bounds error in line 10
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.print_message_14, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange6:
    %indexAddr6 = getelementptr %array_i32, %array_i32* %t9, i32 0, i32 1, i32 9
    %t10 = load i32, i32* %indexAddr6
    call void @print(i32 %t10)
    ;10 end statement: printInt(a1[9]);
    ;11 start statement : return 0;
    ret i32 0
    

}

define %array_i32* @newArray(i32 %size) {
init:
    %sizeLessThanZero = icmp slt i32 %size, 0
    br i1 %sizeLessThanZero, label %negativeSize, label %goodSize
    
negativeSize:
    ; ERROR: Array Size must be positive
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.print_message_15, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
goodSize:
    %arraySizeInBytes = mul i32 %size, 4
    %arraySizeWitLen = add i32 %arraySizeInBytes, 4
    %mallocRes = call i8* @malloc(i32 %arraySizeWitLen)
    %newArray1 = bitcast i8* %mallocRes to %array_i32*
    %sizeAddr = getelementptr %array_i32, %array_i32* %newArray1, i32 0, i32 0
    store i32 %size, i32* %sizeAddr
    %iVar = alloca i32
    store i32 0, i32* %iVar
    br label %loopStart
    
loopStart:
    %i = load i32, i32* %iVar
    %smallerSize = icmp slt i32 %i, %size
    br i1 %smallerSize, label %loopBody, label %loopEnd
    
loopBody:
    %iAddr = getelementptr %array_i32, %array_i32* %newArray1, i32 0, i32 1, i32 %i
    store i32 0, i32* %iAddr
    %nextI = add i32 %i, 1
    store i32 %nextI, i32* %iVar
    br label %loopStart
    
loopEnd:
    ret %array_i32* %newArray1
    

}


declare noalias i8* @malloc(i32)

declare i32 @printf(i8*, ...)

declare void @exit(i32)

@.printstr = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
define void @print(i32 %i) {
    %temp = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.printstr, i32 0, i32 0), i32 %i)
    ret void
}
