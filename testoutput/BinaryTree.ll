

%vTable_BT = type {
     i32(%BT*)*  ; Start
}

%BT = type {
     %vTable_BT*  ; vTablePointer: BT
}

%vTable_Tree = type {
     i1(%Tree*, i32)*  ; Init
    ,i1(%Tree*, %Tree*)*  ; SetRight
    ,i1(%Tree*, %Tree*)*  ; SetLeft
    ,%Tree*(%Tree*)*  ; GetRight
    ,%Tree*(%Tree*)*  ; GetLeft
    ,i32(%Tree*)*  ; GetKey
    ,i1(%Tree*, i32)*  ; SetKey
    ,i1(%Tree*)*  ; GetHas_Right
    ,i1(%Tree*)*  ; GetHas_Left
    ,i1(%Tree*, i1)*  ; SetHas_Left
    ,i1(%Tree*, i1)*  ; SetHas_Right
    ,i1(%Tree*, i32, i32)*  ; Compare
    ,i1(%Tree*, i32)*  ; Insert
    ,i1(%Tree*, i32)*  ; Delete
    ,i1(%Tree*, %Tree*, %Tree*)*  ; Remove
    ,i1(%Tree*, %Tree*, %Tree*)*  ; RemoveRight
    ,i1(%Tree*, %Tree*, %Tree*)*  ; RemoveLeft
    ,i32(%Tree*, i32)*  ; Search
    ,i1(%Tree*)*  ; Print
    ,i1(%Tree*, %Tree*)*  ; RecPrint
}

%Tree = type {
     %vTable_Tree*  ; vTablePointer: Tree
    ,%Tree*  ; left
    ,%Tree*  ; right
    ,i32  ; key
    ,i1  ; has_left
    ,i1  ; has_right
    ,%Tree*  ; my_null
}

@vTable_BT1 = constant %vTable_BT  {
    i32(%BT*)* @Start
}


@vTable_Tree1 = constant %vTable_Tree  {
    i1(%Tree*, i32)* @Init,
    i1(%Tree*, %Tree*)* @SetRight,
    i1(%Tree*, %Tree*)* @SetLeft,
    %Tree*(%Tree*)* @GetRight,
    %Tree*(%Tree*)* @GetLeft,
    i32(%Tree*)* @GetKey,
    i1(%Tree*, i32)* @SetKey,
    i1(%Tree*)* @GetHas_Right,
    i1(%Tree*)* @GetHas_Left,
    i1(%Tree*, i1)* @SetHas_Left,
    i1(%Tree*, i1)* @SetHas_Right,
    i1(%Tree*, i32, i32)* @Compare,
    i1(%Tree*, i32)* @Insert,
    i1(%Tree*, i32)* @Delete,
    i1(%Tree*, %Tree*, %Tree*)* @Remove,
    i1(%Tree*, %Tree*, %Tree*)* @RemoveRight,
    i1(%Tree*, %Tree*, %Tree*)* @RemoveLeft,
    i32(%Tree*, i32)* @Search,
    i1(%Tree*)* @Print,
    i1(%Tree*, %Tree*)* @RecPrint
}


define i32 @Start(%BT* %this) {
initMethod:
    %root = alloca %Tree*
    %ntb = alloca i1
    %nti = alloca i32
    ;10 start statement : {
    ;11 start statement : Tree root
    ;11 end statement: Tree root
    ;12 start statement : boolean ntb
    ;12 end statement: boolean ntb
    ;13 start statement : int nti
    ;13 end statement: int nti
    ;15 start statement : root = new Tree();
    %constrRes = call %Tree* @"Create Tree"()
    store %Tree* %constrRes, %Tree** %root
    ;15 end statement: root = new Tree();
    ;16 start statement : ntb = root.Init(16);
    %t = load %Tree*, %Tree** %root
    %vTablePointer = getelementptr %Tree, %Tree* %t, i32 0, i32 0
    %vTablePoint = load %vTable_Tree*, %vTable_Tree** %vTablePointer
    %procedurePointer = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint, i32 0, i32 0
    %loadedProcedure = load i1(%Tree*, i32)*, i1(%Tree*, i32)** %procedurePointer
    %Init_result = call i1 %loadedProcedure(%Tree* %t, i32 16)
    store i1 %Init_result, i1* %ntb
    ;16 end statement: ntb = root.Init(16);
    ;17 start statement : ntb = root.Print();
    %t1 = load %Tree*, %Tree** %root
    %vTablePointer1 = getelementptr %Tree, %Tree* %t1, i32 0, i32 0
    %vTablePoint1 = load %vTable_Tree*, %vTable_Tree** %vTablePointer1
    %procedurePointer1 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint1, i32 0, i32 18
    %loadedProcedure1 = load i1(%Tree*)*, i1(%Tree*)** %procedurePointer1
    %Print_result = call i1 %loadedProcedure1(%Tree* %t1)
    store i1 %Print_result, i1* %ntb
    ;17 end statement: ntb = root.Print();
    ;18 start statement : printInt(100000000);
    call void @print(i32 100000000)
    ;18 end statement: printInt(100000000);
    ;19 start statement : ntb = root.Insert(8);
    %t2 = load %Tree*, %Tree** %root
    %vTablePointer2 = getelementptr %Tree, %Tree* %t2, i32 0, i32 0
    %vTablePoint2 = load %vTable_Tree*, %vTable_Tree** %vTablePointer2
    %procedurePointer2 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint2, i32 0, i32 12
    %loadedProcedure2 = load i1(%Tree*, i32)*, i1(%Tree*, i32)** %procedurePointer2
    %Insert_result = call i1 %loadedProcedure2(%Tree* %t2, i32 8)
    store i1 %Insert_result, i1* %ntb
    ;19 end statement: ntb = root.Insert(8);
    ;20 start statement : ntb = root.Print();
    %t3 = load %Tree*, %Tree** %root
    %vTablePointer3 = getelementptr %Tree, %Tree* %t3, i32 0, i32 0
    %vTablePoint3 = load %vTable_Tree*, %vTable_Tree** %vTablePointer3
    %procedurePointer3 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint3, i32 0, i32 18
    %loadedProcedure3 = load i1(%Tree*)*, i1(%Tree*)** %procedurePointer3
    %Print_result1 = call i1 %loadedProcedure3(%Tree* %t3)
    store i1 %Print_result1, i1* %ntb
    ;20 end statement: ntb = root.Print();
    ;21 start statement : ntb = root.Insert(24);
    %t4 = load %Tree*, %Tree** %root
    %vTablePointer4 = getelementptr %Tree, %Tree* %t4, i32 0, i32 0
    %vTablePoint4 = load %vTable_Tree*, %vTable_Tree** %vTablePointer4
    %procedurePointer4 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint4, i32 0, i32 12
    %loadedProcedure4 = load i1(%Tree*, i32)*, i1(%Tree*, i32)** %procedurePointer4
    %Insert_result1 = call i1 %loadedProcedure4(%Tree* %t4, i32 24)
    store i1 %Insert_result1, i1* %ntb
    ;21 end statement: ntb = root.Insert(24);
    ;22 start statement : ntb = root.Insert(4);
    %t5 = load %Tree*, %Tree** %root
    %vTablePointer5 = getelementptr %Tree, %Tree* %t5, i32 0, i32 0
    %vTablePoint5 = load %vTable_Tree*, %vTable_Tree** %vTablePointer5
    %procedurePointer5 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint5, i32 0, i32 12
    %loadedProcedure5 = load i1(%Tree*, i32)*, i1(%Tree*, i32)** %procedurePointer5
    %Insert_result2 = call i1 %loadedProcedure5(%Tree* %t5, i32 4)
    store i1 %Insert_result2, i1* %ntb
    ;22 end statement: ntb = root.Insert(4);
    ;23 start statement : ntb = root.Insert(12);
    %t6 = load %Tree*, %Tree** %root
    %vTablePointer6 = getelementptr %Tree, %Tree* %t6, i32 0, i32 0
    %vTablePoint6 = load %vTable_Tree*, %vTable_Tree** %vTablePointer6
    %procedurePointer6 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint6, i32 0, i32 12
    %loadedProcedure6 = load i1(%Tree*, i32)*, i1(%Tree*, i32)** %procedurePointer6
    %Insert_result3 = call i1 %loadedProcedure6(%Tree* %t6, i32 12)
    store i1 %Insert_result3, i1* %ntb
    ;23 end statement: ntb = root.Insert(12);
    ;24 start statement : ntb = root.Insert(20);
    %t7 = load %Tree*, %Tree** %root
    %vTablePointer7 = getelementptr %Tree, %Tree* %t7, i32 0, i32 0
    %vTablePoint7 = load %vTable_Tree*, %vTable_Tree** %vTablePointer7
    %procedurePointer7 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint7, i32 0, i32 12
    %loadedProcedure7 = load i1(%Tree*, i32)*, i1(%Tree*, i32)** %procedurePointer7
    %Insert_result4 = call i1 %loadedProcedure7(%Tree* %t7, i32 20)
    store i1 %Insert_result4, i1* %ntb
    ;24 end statement: ntb = root.Insert(20);
    ;25 start statement : ntb = root.Insert(28);
    %t8 = load %Tree*, %Tree** %root
    %vTablePointer8 = getelementptr %Tree, %Tree* %t8, i32 0, i32 0
    %vTablePoint8 = load %vTable_Tree*, %vTable_Tree** %vTablePointer8
    %procedurePointer8 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint8, i32 0, i32 12
    %loadedProcedure8 = load i1(%Tree*, i32)*, i1(%Tree*, i32)** %procedurePointer8
    %Insert_result5 = call i1 %loadedProcedure8(%Tree* %t8, i32 28)
    store i1 %Insert_result5, i1* %ntb
    ;25 end statement: ntb = root.Insert(28);
    ;26 start statement : ntb = root.Insert(14);
    %t9 = load %Tree*, %Tree** %root
    %vTablePointer9 = getelementptr %Tree, %Tree* %t9, i32 0, i32 0
    %vTablePoint9 = load %vTable_Tree*, %vTable_Tree** %vTablePointer9
    %procedurePointer9 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint9, i32 0, i32 12
    %loadedProcedure9 = load i1(%Tree*, i32)*, i1(%Tree*, i32)** %procedurePointer9
    %Insert_result6 = call i1 %loadedProcedure9(%Tree* %t9, i32 14)
    store i1 %Insert_result6, i1* %ntb
    ;26 end statement: ntb = root.Insert(14);
    ;27 start statement : ntb = root.Print();
    %t10 = load %Tree*, %Tree** %root
    %vTablePointer10 = getelementptr %Tree, %Tree* %t10, i32 0, i32 0
    %vTablePoint10 = load %vTable_Tree*, %vTable_Tree** %vTablePointer10
    %procedurePointer10 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint10, i32 0, i32 18
    %loadedProcedure10 = load i1(%Tree*)*, i1(%Tree*)** %procedurePointer10
    %Print_result2 = call i1 %loadedProcedure10(%Tree* %t10)
    store i1 %Print_result2, i1* %ntb
    ;27 end statement: ntb = root.Print();
    ;28 start statement : printInt(888888888);
    call void @print(i32 888888888)
    ;28 end statement: printInt(888888888);
    ;29 start statement : printInt(root.Search(24));
    %t11 = load %Tree*, %Tree** %root
    %vTablePointer11 = getelementptr %Tree, %Tree* %t11, i32 0, i32 0
    %vTablePoint11 = load %vTable_Tree*, %vTable_Tree** %vTablePointer11
    %procedurePointer11 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint11, i32 0, i32 17
    %loadedProcedure11 = load i32(%Tree*, i32)*, i32(%Tree*, i32)** %procedurePointer11
    %Search_result = call i32 %loadedProcedure11(%Tree* %t11, i32 24)
    call void @print(i32 %Search_result)
    ;29 end statement: printInt(root.Search(24));
    ;30 start statement : printInt(root.Search(12));
    %t12 = load %Tree*, %Tree** %root
    %vTablePointer12 = getelementptr %Tree, %Tree* %t12, i32 0, i32 0
    %vTablePoint12 = load %vTable_Tree*, %vTable_Tree** %vTablePointer12
    %procedurePointer12 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint12, i32 0, i32 17
    %loadedProcedure12 = load i32(%Tree*, i32)*, i32(%Tree*, i32)** %procedurePointer12
    %Search_result1 = call i32 %loadedProcedure12(%Tree* %t12, i32 12)
    call void @print(i32 %Search_result1)
    ;30 end statement: printInt(root.Search(12));
    ;31 start statement : printInt(root.Search(16));
    %t13 = load %Tree*, %Tree** %root
    %vTablePointer13 = getelementptr %Tree, %Tree* %t13, i32 0, i32 0
    %vTablePoint13 = load %vTable_Tree*, %vTable_Tree** %vTablePointer13
    %procedurePointer13 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint13, i32 0, i32 17
    %loadedProcedure13 = load i32(%Tree*, i32)*, i32(%Tree*, i32)** %procedurePointer13
    %Search_result2 = call i32 %loadedProcedure13(%Tree* %t13, i32 16)
    call void @print(i32 %Search_result2)
    ;31 end statement: printInt(root.Search(16));
    ;32 start statement : printInt(root.Search(50));
    %t14 = load %Tree*, %Tree** %root
    %vTablePointer14 = getelementptr %Tree, %Tree* %t14, i32 0, i32 0
    %vTablePoint14 = load %vTable_Tree*, %vTable_Tree** %vTablePointer14
    %procedurePointer14 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint14, i32 0, i32 17
    %loadedProcedure14 = load i32(%Tree*, i32)*, i32(%Tree*, i32)** %procedurePointer14
    %Search_result3 = call i32 %loadedProcedure14(%Tree* %t14, i32 50)
    call void @print(i32 %Search_result3)
    ;32 end statement: printInt(root.Search(50));
    ;33 start statement : printInt(root.Search(12));
    %t15 = load %Tree*, %Tree** %root
    %vTablePointer15 = getelementptr %Tree, %Tree* %t15, i32 0, i32 0
    %vTablePoint15 = load %vTable_Tree*, %vTable_Tree** %vTablePointer15
    %procedurePointer15 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint15, i32 0, i32 17
    %loadedProcedure15 = load i32(%Tree*, i32)*, i32(%Tree*, i32)** %procedurePointer15
    %Search_result4 = call i32 %loadedProcedure15(%Tree* %t15, i32 12)
    call void @print(i32 %Search_result4)
    ;33 end statement: printInt(root.Search(12));
    ;34 start statement : ntb = root.Delete(12);
    %t16 = load %Tree*, %Tree** %root
    %vTablePointer16 = getelementptr %Tree, %Tree* %t16, i32 0, i32 0
    %vTablePoint16 = load %vTable_Tree*, %vTable_Tree** %vTablePointer16
    %procedurePointer16 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint16, i32 0, i32 13
    %loadedProcedure16 = load i1(%Tree*, i32)*, i1(%Tree*, i32)** %procedurePointer16
    %Delete_result = call i1 %loadedProcedure16(%Tree* %t16, i32 12)
    store i1 %Delete_result, i1* %ntb
    ;34 end statement: ntb = root.Delete(12);
    ;35 start statement : ntb = root.Print();
    %t17 = load %Tree*, %Tree** %root
    %vTablePointer17 = getelementptr %Tree, %Tree* %t17, i32 0, i32 0
    %vTablePoint17 = load %vTable_Tree*, %vTable_Tree** %vTablePointer17
    %procedurePointer17 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint17, i32 0, i32 18
    %loadedProcedure17 = load i1(%Tree*)*, i1(%Tree*)** %procedurePointer17
    %Print_result3 = call i1 %loadedProcedure17(%Tree* %t17)
    store i1 %Print_result3, i1* %ntb
    ;35 end statement: ntb = root.Print();
    ;36 start statement : printInt(root.Search(12));
    %t18 = load %Tree*, %Tree** %root
    %vTablePointer18 = getelementptr %Tree, %Tree* %t18, i32 0, i32 0
    %vTablePoint18 = load %vTable_Tree*, %vTable_Tree** %vTablePointer18
    %procedurePointer18 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint18, i32 0, i32 17
    %loadedProcedure18 = load i32(%Tree*, i32)*, i32(%Tree*, i32)** %procedurePointer18
    %Search_result5 = call i32 %loadedProcedure18(%Tree* %t18, i32 12)
    call void @print(i32 %Search_result5)
    ;36 end statement: printInt(root.Search(12));
    ;38 start statement : return 0;
    ret i32 0
    

}

define i1 @Init(%Tree* %this, i32 %v_key) {
initMethod:
    %v_key1 = alloca i32
    store i32 %v_key, i32* %v_key1
    ;52 start statement : {
    ;53 start statement : key = v_key;
    %res = getelementptr %Tree, %Tree* %this, i32 0, i32 3
    %t = load i32, i32* %v_key1
    store i32 %t, i32* %res
    ;53 end statement: key = v_key;
    ;54 start statement : has_left = false;
    %res1 = getelementptr %Tree, %Tree* %this, i32 0, i32 4
    store i1 0, i1* %res1
    ;54 end statement: has_left = false;
    ;55 start statement : has_right = false;
    %res2 = getelementptr %Tree, %Tree* %this, i32 0, i32 5
    store i1 0, i1* %res2
    ;55 end statement: has_right = false;
    ;56 start statement : return true;
    ret i1 1
    

}

define i1 @SetRight(%Tree* %this, %Tree* %rn) {
initMethod:
    %rn1 = alloca %Tree*
    store %Tree* %rn, %Tree** %rn1
    ;60 start statement : {
    ;61 start statement : right = rn;
    %res = getelementptr %Tree, %Tree* %this, i32 0, i32 2
    %t = load %Tree*, %Tree** %rn1
    store %Tree* %t, %Tree** %res
    ;61 end statement: right = rn;
    ;62 start statement : return true;
    ret i1 1
    

}

define i1 @SetLeft(%Tree* %this, %Tree* %ln) {
initMethod:
    %ln1 = alloca %Tree*
    store %Tree* %ln, %Tree** %ln1
    ;66 start statement : {
    ;67 start statement : left = ln;
    %res = getelementptr %Tree, %Tree* %this, i32 0, i32 1
    %t = load %Tree*, %Tree** %ln1
    store %Tree* %t, %Tree** %res
    ;67 end statement: left = ln;
    ;68 start statement : return true;
    ret i1 1
    

}

define %Tree* @GetRight(%Tree* %this) {
initMethod:
    ;71 start statement : {
    ;72 start statement : return right;
    %res = getelementptr %Tree, %Tree* %this, i32 0, i32 2
    %t = load %Tree*, %Tree** %res
    ret %Tree* %t
    

}

define %Tree* @GetLeft(%Tree* %this) {
initMethod:
    ;75 start statement : {
    ;76 start statement : return left;
    %res = getelementptr %Tree, %Tree* %this, i32 0, i32 1
    %t = load %Tree*, %Tree** %res
    ret %Tree* %t
    

}

define i32 @GetKey(%Tree* %this) {
initMethod:
    ;79 start statement : {
    ;80 start statement : return key;
    %res = getelementptr %Tree, %Tree* %this, i32 0, i32 3
    %t = load i32, i32* %res
    ret i32 %t
    

}

define i1 @SetKey(%Tree* %this, i32 %v_key) {
initMethod:
    %v_key1 = alloca i32
    store i32 %v_key, i32* %v_key1
    ;83 start statement : {
    ;84 start statement : key = v_key;
    %res = getelementptr %Tree, %Tree* %this, i32 0, i32 3
    %t = load i32, i32* %v_key1
    store i32 %t, i32* %res
    ;84 end statement: key = v_key;
    ;85 start statement : return true;
    ret i1 1
    

}

define i1 @GetHas_Right(%Tree* %this) {
initMethod:
    ;88 start statement : {
    ;89 start statement : return has_right;
    %res = getelementptr %Tree, %Tree* %this, i32 0, i32 5
    %t = load i1, i1* %res
    ret i1 %t
    

}

define i1 @GetHas_Left(%Tree* %this) {
initMethod:
    ;92 start statement : {
    ;93 start statement : return has_left;
    %res = getelementptr %Tree, %Tree* %this, i32 0, i32 4
    %t = load i1, i1* %res
    ret i1 %t
    

}

define i1 @SetHas_Left(%Tree* %this, i1 %val) {
initMethod:
    %val1 = alloca i1
    store i1 %val, i1* %val1
    ;96 start statement : {
    ;97 start statement : has_left = val;
    %res = getelementptr %Tree, %Tree* %this, i32 0, i32 4
    %t = load i1, i1* %val1
    store i1 %t, i1* %res
    ;97 end statement: has_left = val;
    ;98 start statement : return true;
    ret i1 1
    

}

define i1 @SetHas_Right(%Tree* %this, i1 %val) {
initMethod:
    %val1 = alloca i1
    store i1 %val, i1* %val1
    ;101 start statement : {
    ;102 start statement : has_right = val;
    %res = getelementptr %Tree, %Tree* %this, i32 0, i32 5
    %t = load i1, i1* %val1
    store i1 %t, i1* %res
    ;102 end statement: has_right = val;
    ;103 start statement : return true;
    ret i1 1
    

}

define i1 @Compare(%Tree* %this, i32 %num1, i32 %num2) {
initMethod:
    %num11 = alloca i32
    store i32 %num1, i32* %num11
    %num21 = alloca i32
    store i32 %num2, i32* %num21
    %ntb = alloca i1
    %nti = alloca i32
    ;109 start statement : {
    ;110 start statement : boolean ntb
    ;110 end statement: boolean ntb
    ;111 start statement : int nti
    ;111 end statement: int nti
    ;113 start statement : ntb = false;
    store i1 0, i1* %ntb
    ;113 end statement: ntb = false;
    ;114 start statement : nti = (num2 + 1);
    %t = load i32, i32* %num21
    %resAddImpl = add i32 %t, 1
    store i32 %resAddImpl, i32* %nti
    ;114 end statement: nti = (num2 + 1);
    ;115 start statement : if ((num1 < num2)) ntb = false;
    %t1 = load i32, i32* %num11
    %t2 = load i32, i32* %num21
    %resSltImpl = icmp slt i32 %t1, %t2
    br i1 %resSltImpl, label %ifTrue, label %ifFalse
    
ifTrue:
    ;116 start statement : ntb = false;
    store i1 0, i1* %ntb
    ;116 end statement: ntb = false;
    br label %endif1
    
ifFalse:
    ;117 start statement : if ((! (num1 < nti))) ntb = false;
    %t3 = load i32, i32* %num11
    %t4 = load i32, i32* %nti
    %resSltImpl1 = icmp slt i32 %t3, %t4
    %neg_res = icmp eq i1 0, %resSltImpl1
    br i1 %neg_res, label %ifTrue1, label %ifFalse1
    
ifTrue1:
    ;118 start statement : ntb = false;
    store i1 0, i1* %ntb
    ;118 end statement: ntb = false;
    br label %endif
    
ifFalse1:
    ;120 start statement : ntb = true;
    store i1 1, i1* %ntb
    ;120 end statement: ntb = true;
    br label %endif
    
endif:
    ;117 end statement: if ((! (num1 < nti))) ntb = false;
    br label %endif1
    
endif1:
    ;115 end statement: if ((num1 < num2)) ntb = false;
    ;121 start statement : return ntb;
    %t5 = load i1, i1* %ntb
    ret i1 %t5
    

}

define i1 @Insert(%Tree* %this, i32 %v_key) {
initMethod:
    %v_key1 = alloca i32
    store i32 %v_key, i32* %v_key1
    %new_node = alloca %Tree*
    %ntb = alloca i1
    %cont = alloca i1
    %key_aux = alloca i32
    %current_node = alloca %Tree*
    ;125 start statement : {
    ;126 start statement : Tree new_node
    ;126 end statement: Tree new_node
    ;127 start statement : boolean ntb
    ;127 end statement: boolean ntb
    ;128 start statement : boolean cont
    ;128 end statement: boolean cont
    ;129 start statement : int key_aux
    ;129 end statement: int key_aux
    ;130 start statement : Tree current_node
    ;130 end statement: Tree current_node
    ;132 start statement : new_node = new Tree();
    %constrRes = call %Tree* @"Create Tree"()
    store %Tree* %constrRes, %Tree** %new_node
    ;132 end statement: new_node = new Tree();
    ;133 start statement : ntb = new_node.Init(v_key);
    %t = load %Tree*, %Tree** %new_node
    %vTablePointer = getelementptr %Tree, %Tree* %t, i32 0, i32 0
    %vTablePoint = load %vTable_Tree*, %vTable_Tree** %vTablePointer
    %procedurePointer = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint, i32 0, i32 0
    %loadedProcedure = load i1(%Tree*, i32)*, i1(%Tree*, i32)** %procedurePointer
    %t1 = load i32, i32* %v_key1
    %Init_result = call i1 %loadedProcedure(%Tree* %t, i32 %t1)
    store i1 %Init_result, i1* %ntb
    ;133 end statement: ntb = new_node.Init(v_key);
    ;134 start statement : current_node = this;
    store %Tree* %this, %Tree** %current_node
    ;134 end statement: current_node = this;
    ;135 start statement : cont = true;
    store i1 1, i1* %cont
    ;135 end statement: cont = true;
    ;136 start statement : while (cont) {
    br label %whileStart
    
whileStart:
    %t2 = load i1, i1* %cont
    br i1 %t2, label %loopBodyStart, label %endloop
    
loopBodyStart:
    ;136 start statement : {
    ;137 start statement : key_aux = current_node.GetKey();
    %t3 = load %Tree*, %Tree** %current_node
    %vTablePointer1 = getelementptr %Tree, %Tree* %t3, i32 0, i32 0
    %vTablePoint1 = load %vTable_Tree*, %vTable_Tree** %vTablePointer1
    %procedurePointer1 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint1, i32 0, i32 5
    %loadedProcedure1 = load i32(%Tree*)*, i32(%Tree*)** %procedurePointer1
    %GetKey_result = call i32 %loadedProcedure1(%Tree* %t3)
    store i32 %GetKey_result, i32* %key_aux
    ;137 end statement: key_aux = current_node.GetKey();
    ;138 start statement : if ((v_key < key_aux)) {
    %t4 = load i32, i32* %v_key1
    %t5 = load i32, i32* %key_aux
    %resSltImpl = icmp slt i32 %t4, %t5
    br i1 %resSltImpl, label %ifTrue, label %ifFalse1
    
ifTrue:
    ;138 start statement : {
    ;139 start statement : if (current_node.GetHas_Left()) current_node = current_node.GetLeft();
    %t6 = load %Tree*, %Tree** %current_node
    %vTablePointer2 = getelementptr %Tree, %Tree* %t6, i32 0, i32 0
    %vTablePoint2 = load %vTable_Tree*, %vTable_Tree** %vTablePointer2
    %procedurePointer2 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint2, i32 0, i32 8
    %loadedProcedure2 = load i1(%Tree*)*, i1(%Tree*)** %procedurePointer2
    %GetHas_Left_result = call i1 %loadedProcedure2(%Tree* %t6)
    br i1 %GetHas_Left_result, label %ifTrue1, label %ifFalse
    
ifTrue1:
    ;140 start statement : current_node = current_node.GetLeft();
    %t7 = load %Tree*, %Tree** %current_node
    %vTablePointer3 = getelementptr %Tree, %Tree* %t7, i32 0, i32 0
    %vTablePoint3 = load %vTable_Tree*, %vTable_Tree** %vTablePointer3
    %procedurePointer3 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint3, i32 0, i32 4
    %loadedProcedure3 = load %Tree*(%Tree*)*, %Tree*(%Tree*)** %procedurePointer3
    %GetLeft_result = call %Tree* %loadedProcedure3(%Tree* %t7)
    store %Tree* %GetLeft_result, %Tree** %current_node
    ;140 end statement: current_node = current_node.GetLeft();
    br label %endif
    
ifFalse:
    ;139 start statement : {
    ;142 start statement : cont = false;
    store i1 0, i1* %cont
    ;142 end statement: cont = false;
    ;143 start statement : ntb = current_node.SetHas_Left(true);
    %t8 = load %Tree*, %Tree** %current_node
    %vTablePointer4 = getelementptr %Tree, %Tree* %t8, i32 0, i32 0
    %vTablePoint4 = load %vTable_Tree*, %vTable_Tree** %vTablePointer4
    %procedurePointer4 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint4, i32 0, i32 9
    %loadedProcedure4 = load i1(%Tree*, i1)*, i1(%Tree*, i1)** %procedurePointer4
    %SetHas_Left_result = call i1 %loadedProcedure4(%Tree* %t8, i1 1)
    store i1 %SetHas_Left_result, i1* %ntb
    ;143 end statement: ntb = current_node.SetHas_Left(true);
    ;144 start statement : ntb = current_node.SetLeft(new_node);
    %t9 = load %Tree*, %Tree** %current_node
    %vTablePointer5 = getelementptr %Tree, %Tree* %t9, i32 0, i32 0
    %vTablePoint5 = load %vTable_Tree*, %vTable_Tree** %vTablePointer5
    %procedurePointer5 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint5, i32 0, i32 2
    %loadedProcedure5 = load i1(%Tree*, %Tree*)*, i1(%Tree*, %Tree*)** %procedurePointer5
    %t10 = load %Tree*, %Tree** %new_node
    %SetLeft_result = call i1 %loadedProcedure5(%Tree* %t9, %Tree* %t10)
    store i1 %SetLeft_result, i1* %ntb
    ;144 end statement: ntb = current_node.SetLeft(new_node);
    ;139 end statement: {
    br label %endif
    
endif:
    ;139 end statement: if (current_node.GetHas_Left()) current_node = current_node.GetLeft();
    ;138 end statement: {
    br label %endif2
    
ifFalse1:
    ;138 start statement : {
    ;147 start statement : if (current_node.GetHas_Right()) current_node = current_node.GetRight();
    %t11 = load %Tree*, %Tree** %current_node
    %vTablePointer6 = getelementptr %Tree, %Tree* %t11, i32 0, i32 0
    %vTablePoint6 = load %vTable_Tree*, %vTable_Tree** %vTablePointer6
    %procedurePointer6 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint6, i32 0, i32 7
    %loadedProcedure6 = load i1(%Tree*)*, i1(%Tree*)** %procedurePointer6
    %GetHas_Right_result = call i1 %loadedProcedure6(%Tree* %t11)
    br i1 %GetHas_Right_result, label %ifTrue2, label %ifFalse2
    
ifTrue2:
    ;148 start statement : current_node = current_node.GetRight();
    %t12 = load %Tree*, %Tree** %current_node
    %vTablePointer7 = getelementptr %Tree, %Tree* %t12, i32 0, i32 0
    %vTablePoint7 = load %vTable_Tree*, %vTable_Tree** %vTablePointer7
    %procedurePointer7 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint7, i32 0, i32 3
    %loadedProcedure7 = load %Tree*(%Tree*)*, %Tree*(%Tree*)** %procedurePointer7
    %GetRight_result = call %Tree* %loadedProcedure7(%Tree* %t12)
    store %Tree* %GetRight_result, %Tree** %current_node
    ;148 end statement: current_node = current_node.GetRight();
    br label %endif1
    
ifFalse2:
    ;147 start statement : {
    ;150 start statement : cont = false;
    store i1 0, i1* %cont
    ;150 end statement: cont = false;
    ;151 start statement : ntb = current_node.SetHas_Right(true);
    %t13 = load %Tree*, %Tree** %current_node
    %vTablePointer8 = getelementptr %Tree, %Tree* %t13, i32 0, i32 0
    %vTablePoint8 = load %vTable_Tree*, %vTable_Tree** %vTablePointer8
    %procedurePointer8 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint8, i32 0, i32 10
    %loadedProcedure8 = load i1(%Tree*, i1)*, i1(%Tree*, i1)** %procedurePointer8
    %SetHas_Right_result = call i1 %loadedProcedure8(%Tree* %t13, i1 1)
    store i1 %SetHas_Right_result, i1* %ntb
    ;151 end statement: ntb = current_node.SetHas_Right(true);
    ;152 start statement : ntb = current_node.SetRight(new_node);
    %t14 = load %Tree*, %Tree** %current_node
    %vTablePointer9 = getelementptr %Tree, %Tree* %t14, i32 0, i32 0
    %vTablePoint9 = load %vTable_Tree*, %vTable_Tree** %vTablePointer9
    %procedurePointer9 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint9, i32 0, i32 1
    %loadedProcedure9 = load i1(%Tree*, %Tree*)*, i1(%Tree*, %Tree*)** %procedurePointer9
    %t15 = load %Tree*, %Tree** %new_node
    %SetRight_result = call i1 %loadedProcedure9(%Tree* %t14, %Tree* %t15)
    store i1 %SetRight_result, i1* %ntb
    ;152 end statement: ntb = current_node.SetRight(new_node);
    ;147 end statement: {
    br label %endif1
    
endif1:
    ;147 end statement: if (current_node.GetHas_Right()) current_node = current_node.GetRight();
    ;138 end statement: {
    br label %endif2
    
endif2:
    ;138 end statement: if ((v_key < key_aux)) {
    ;136 end statement: {
    br label %whileStart
    
endloop:
    ;136 end statement: while (cont) {
    ;156 start statement : return true;
    ret i1 1
    

}

define i1 @Delete(%Tree* %this, i32 %v_key) {
initMethod:
    %v_key1 = alloca i32
    store i32 %v_key, i32* %v_key1
    %current_node = alloca %Tree*
    %parent_node = alloca %Tree*
    %cont = alloca i1
    %found = alloca i1
    %is_root = alloca i1
    %key_aux = alloca i32
    %ntb = alloca i1
    ;160 start statement : {
    ;161 start statement : Tree current_node
    ;161 end statement: Tree current_node
    ;162 start statement : Tree parent_node
    ;162 end statement: Tree parent_node
    ;163 start statement : boolean cont
    ;163 end statement: boolean cont
    ;164 start statement : boolean found
    ;164 end statement: boolean found
    ;165 start statement : boolean is_root
    ;165 end statement: boolean is_root
    ;166 start statement : int key_aux
    ;166 end statement: int key_aux
    ;167 start statement : boolean ntb
    ;167 end statement: boolean ntb
    ;169 start statement : current_node = this;
    store %Tree* %this, %Tree** %current_node
    ;169 end statement: current_node = this;
    ;170 start statement : parent_node = this;
    store %Tree* %this, %Tree** %parent_node
    ;170 end statement: parent_node = this;
    ;171 start statement : cont = true;
    store i1 1, i1* %cont
    ;171 end statement: cont = true;
    ;172 start statement : found = false;
    store i1 0, i1* %found
    ;172 end statement: found = false;
    ;173 start statement : is_root = true;
    store i1 1, i1* %is_root
    ;173 end statement: is_root = true;
    ;174 start statement : while (cont) {
    br label %whileStart
    
whileStart:
    %t = load i1, i1* %cont
    br i1 %t, label %loopBodyStart, label %endloop
    
loopBodyStart:
    ;174 start statement : {
    ;175 start statement : key_aux = current_node.GetKey();
    %t1 = load %Tree*, %Tree** %current_node
    %vTablePointer = getelementptr %Tree, %Tree* %t1, i32 0, i32 0
    %vTablePoint = load %vTable_Tree*, %vTable_Tree** %vTablePointer
    %procedurePointer = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint, i32 0, i32 5
    %loadedProcedure = load i32(%Tree*)*, i32(%Tree*)** %procedurePointer
    %GetKey_result = call i32 %loadedProcedure(%Tree* %t1)
    store i32 %GetKey_result, i32* %key_aux
    ;175 end statement: key_aux = current_node.GetKey();
    ;176 start statement : if ((v_key < key_aux)) if (current_node.GetHas_Left()) {
    %t2 = load i32, i32* %v_key1
    %t3 = load i32, i32* %key_aux
    %resSltImpl = icmp slt i32 %t2, %t3
    br i1 %resSltImpl, label %ifTrue, label %ifFalse1
    
ifTrue:
    ;177 start statement : if (current_node.GetHas_Left()) {
    %t4 = load %Tree*, %Tree** %current_node
    %vTablePointer1 = getelementptr %Tree, %Tree* %t4, i32 0, i32 0
    %vTablePoint1 = load %vTable_Tree*, %vTable_Tree** %vTablePointer1
    %procedurePointer1 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint1, i32 0, i32 8
    %loadedProcedure1 = load i1(%Tree*)*, i1(%Tree*)** %procedurePointer1
    %GetHas_Left_result = call i1 %loadedProcedure1(%Tree* %t4)
    br i1 %GetHas_Left_result, label %ifTrue1, label %ifFalse
    
ifTrue1:
    ;177 start statement : {
    ;178 start statement : parent_node = current_node;
    %t5 = load %Tree*, %Tree** %current_node
    store %Tree* %t5, %Tree** %parent_node
    ;178 end statement: parent_node = current_node;
    ;179 start statement : current_node = current_node.GetLeft();
    %t6 = load %Tree*, %Tree** %current_node
    %vTablePointer2 = getelementptr %Tree, %Tree* %t6, i32 0, i32 0
    %vTablePoint2 = load %vTable_Tree*, %vTable_Tree** %vTablePointer2
    %procedurePointer2 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint2, i32 0, i32 4
    %loadedProcedure2 = load %Tree*(%Tree*)*, %Tree*(%Tree*)** %procedurePointer2
    %GetLeft_result = call %Tree* %loadedProcedure2(%Tree* %t6)
    store %Tree* %GetLeft_result, %Tree** %current_node
    ;179 end statement: current_node = current_node.GetLeft();
    ;177 end statement: {
    br label %endif
    
ifFalse:
    ;181 start statement : cont = false;
    store i1 0, i1* %cont
    ;181 end statement: cont = false;
    br label %endif
    
endif:
    ;177 end statement: if (current_node.GetHas_Left()) {
    br label %endif5
    
ifFalse1:
    ;182 start statement : if ((key_aux < v_key)) if (current_node.GetHas_Right()) {
    %t7 = load i32, i32* %key_aux
    %t8 = load i32, i32* %v_key1
    %resSltImpl1 = icmp slt i32 %t7, %t8
    br i1 %resSltImpl1, label %ifTrue2, label %ifFalse3
    
ifTrue2:
    ;183 start statement : if (current_node.GetHas_Right()) {
    %t9 = load %Tree*, %Tree** %current_node
    %vTablePointer3 = getelementptr %Tree, %Tree* %t9, i32 0, i32 0
    %vTablePoint3 = load %vTable_Tree*, %vTable_Tree** %vTablePointer3
    %procedurePointer3 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint3, i32 0, i32 7
    %loadedProcedure3 = load i1(%Tree*)*, i1(%Tree*)** %procedurePointer3
    %GetHas_Right_result = call i1 %loadedProcedure3(%Tree* %t9)
    br i1 %GetHas_Right_result, label %ifTrue3, label %ifFalse2
    
ifTrue3:
    ;183 start statement : {
    ;184 start statement : parent_node = current_node;
    %t10 = load %Tree*, %Tree** %current_node
    store %Tree* %t10, %Tree** %parent_node
    ;184 end statement: parent_node = current_node;
    ;185 start statement : current_node = current_node.GetRight();
    %t11 = load %Tree*, %Tree** %current_node
    %vTablePointer4 = getelementptr %Tree, %Tree* %t11, i32 0, i32 0
    %vTablePoint4 = load %vTable_Tree*, %vTable_Tree** %vTablePointer4
    %procedurePointer4 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint4, i32 0, i32 3
    %loadedProcedure4 = load %Tree*(%Tree*)*, %Tree*(%Tree*)** %procedurePointer4
    %GetRight_result = call %Tree* %loadedProcedure4(%Tree* %t11)
    store %Tree* %GetRight_result, %Tree** %current_node
    ;185 end statement: current_node = current_node.GetRight();
    ;183 end statement: {
    br label %endif1
    
ifFalse2:
    ;187 start statement : cont = false;
    store i1 0, i1* %cont
    ;187 end statement: cont = false;
    br label %endif1
    
endif1:
    ;183 end statement: if (current_node.GetHas_Right()) {
    br label %endif4
    
ifFalse3:
    ;182 start statement : {
    ;189 start statement : if (is_root) if (((! current_node.GetHas_Right()) && (! current_node.GetHas_Left()))) ntb = true;
    %t12 = load i1, i1* %is_root
    br i1 %t12, label %ifTrue4, label %ifFalse5
    
ifTrue4:
    ;190 start statement : if (((! current_node.GetHas_Right()) && (! current_node.GetHas_Left()))) ntb = true;
    %t13 = load %Tree*, %Tree** %current_node
    %vTablePointer5 = getelementptr %Tree, %Tree* %t13, i32 0, i32 0
    %vTablePoint5 = load %vTable_Tree*, %vTable_Tree** %vTablePointer5
    %procedurePointer5 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint5, i32 0, i32 7
    %loadedProcedure5 = load i1(%Tree*)*, i1(%Tree*)** %procedurePointer5
    %GetHas_Right_result1 = call i1 %loadedProcedure5(%Tree* %t13)
    %neg_res = icmp eq i1 0, %GetHas_Right_result1
    %andResVar = alloca i1
    store i1 %neg_res, i1* %andResVar
    br i1 %neg_res, label %and_first_true, label %and_end
    
and_first_true:
    %t14 = load %Tree*, %Tree** %current_node
    %vTablePointer6 = getelementptr %Tree, %Tree* %t14, i32 0, i32 0
    %vTablePoint6 = load %vTable_Tree*, %vTable_Tree** %vTablePointer6
    %procedurePointer6 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint6, i32 0, i32 8
    %loadedProcedure6 = load i1(%Tree*)*, i1(%Tree*)** %procedurePointer6
    %GetHas_Left_result1 = call i1 %loadedProcedure6(%Tree* %t14)
    %neg_res1 = icmp eq i1 0, %GetHas_Left_result1
    store i1 %neg_res1, i1* %andResVar
    br label %and_end
    
and_end:
    %andRes = load i1, i1* %andResVar
    br i1 %andRes, label %ifTrue5, label %ifFalse4
    
ifTrue5:
    ;192 start statement : ntb = true;
    store i1 1, i1* %ntb
    ;192 end statement: ntb = true;
    br label %endif2
    
ifFalse4:
    ;194 start statement : ntb = this.Remove(parent_node, current_node);
    %vTablePointer7 = getelementptr %Tree, %Tree* %this, i32 0, i32 0
    %vTablePoint7 = load %vTable_Tree*, %vTable_Tree** %vTablePointer7
    %procedurePointer7 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint7, i32 0, i32 14
    %loadedProcedure7 = load i1(%Tree*, %Tree*, %Tree*)*, i1(%Tree*, %Tree*, %Tree*)** %procedurePointer7
    %t15 = load %Tree*, %Tree** %parent_node
    %t16 = load %Tree*, %Tree** %current_node
    %Remove_result = call i1 %loadedProcedure7(%Tree* %this, %Tree* %t15, %Tree* %t16)
    store i1 %Remove_result, i1* %ntb
    ;194 end statement: ntb = this.Remove(parent_node, current_node);
    br label %endif2
    
endif2:
    ;190 end statement: if (((! current_node.GetHas_Right()) && (! current_node.GetHas_Left()))) ntb = true;
    br label %endif3
    
ifFalse5:
    ;196 start statement : ntb = this.Remove(parent_node, current_node);
    %vTablePointer8 = getelementptr %Tree, %Tree* %this, i32 0, i32 0
    %vTablePoint8 = load %vTable_Tree*, %vTable_Tree** %vTablePointer8
    %procedurePointer8 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint8, i32 0, i32 14
    %loadedProcedure8 = load i1(%Tree*, %Tree*, %Tree*)*, i1(%Tree*, %Tree*, %Tree*)** %procedurePointer8
    %t17 = load %Tree*, %Tree** %parent_node
    %t18 = load %Tree*, %Tree** %current_node
    %Remove_result1 = call i1 %loadedProcedure8(%Tree* %this, %Tree* %t17, %Tree* %t18)
    store i1 %Remove_result1, i1* %ntb
    ;196 end statement: ntb = this.Remove(parent_node, current_node);
    br label %endif3
    
endif3:
    ;189 end statement: if (is_root) if (((! current_node.GetHas_Right()) && (! current_node.GetHas_Left()))) ntb = true;
    ;197 start statement : found = true;
    store i1 1, i1* %found
    ;197 end statement: found = true;
    ;198 start statement : cont = false;
    store i1 0, i1* %cont
    ;198 end statement: cont = false;
    ;182 end statement: {
    br label %endif4
    
endif4:
    ;182 end statement: if ((key_aux < v_key)) if (current_node.GetHas_Right()) {
    br label %endif5
    
endif5:
    ;176 end statement: if ((v_key < key_aux)) if (current_node.GetHas_Left()) {
    ;200 start statement : is_root = false;
    store i1 0, i1* %is_root
    ;200 end statement: is_root = false;
    ;174 end statement: {
    br label %whileStart
    
endloop:
    ;174 end statement: while (cont) {
    ;202 start statement : return found;
    %t19 = load i1, i1* %found
    ret i1 %t19
    

}

define i1 @Remove(%Tree* %this, %Tree* %p_node, %Tree* %c_node) {
initMethod:
    %p_node1 = alloca %Tree*
    store %Tree* %p_node, %Tree** %p_node1
    %c_node1 = alloca %Tree*
    store %Tree* %c_node, %Tree** %c_node1
    %ntb = alloca i1
    %auxkey1 = alloca i32
    %auxkey2 = alloca i32
    ;207 start statement : {
    ;208 start statement : boolean ntb
    ;208 end statement: boolean ntb
    ;209 start statement : int auxkey1
    ;209 end statement: int auxkey1
    ;210 start statement : int auxkey2
    ;210 end statement: int auxkey2
    ;212 start statement : if (c_node.GetHas_Left()) ntb = this.RemoveLeft(p_node, c_node);
    %t = load %Tree*, %Tree** %c_node1
    %vTablePointer = getelementptr %Tree, %Tree* %t, i32 0, i32 0
    %vTablePoint = load %vTable_Tree*, %vTable_Tree** %vTablePointer
    %procedurePointer = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint, i32 0, i32 8
    %loadedProcedure = load i1(%Tree*)*, i1(%Tree*)** %procedurePointer
    %GetHas_Left_result = call i1 %loadedProcedure(%Tree* %t)
    br i1 %GetHas_Left_result, label %ifTrue, label %ifFalse
    
ifTrue:
    ;213 start statement : ntb = this.RemoveLeft(p_node, c_node);
    %vTablePointer1 = getelementptr %Tree, %Tree* %this, i32 0, i32 0
    %vTablePoint1 = load %vTable_Tree*, %vTable_Tree** %vTablePointer1
    %procedurePointer1 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint1, i32 0, i32 16
    %loadedProcedure1 = load i1(%Tree*, %Tree*, %Tree*)*, i1(%Tree*, %Tree*, %Tree*)** %procedurePointer1
    %t1 = load %Tree*, %Tree** %p_node1
    %t2 = load %Tree*, %Tree** %c_node1
    %RemoveLeft_result = call i1 %loadedProcedure1(%Tree* %this, %Tree* %t1, %Tree* %t2)
    store i1 %RemoveLeft_result, i1* %ntb
    ;213 end statement: ntb = this.RemoveLeft(p_node, c_node);
    br label %endif2
    
ifFalse:
    ;214 start statement : if (c_node.GetHas_Right()) ntb = this.RemoveRight(p_node, c_node);
    %t3 = load %Tree*, %Tree** %c_node1
    %vTablePointer2 = getelementptr %Tree, %Tree* %t3, i32 0, i32 0
    %vTablePoint2 = load %vTable_Tree*, %vTable_Tree** %vTablePointer2
    %procedurePointer2 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint2, i32 0, i32 7
    %loadedProcedure2 = load i1(%Tree*)*, i1(%Tree*)** %procedurePointer2
    %GetHas_Right_result = call i1 %loadedProcedure2(%Tree* %t3)
    br i1 %GetHas_Right_result, label %ifTrue1, label %ifFalse1
    
ifTrue1:
    ;215 start statement : ntb = this.RemoveRight(p_node, c_node);
    %vTablePointer3 = getelementptr %Tree, %Tree* %this, i32 0, i32 0
    %vTablePoint3 = load %vTable_Tree*, %vTable_Tree** %vTablePointer3
    %procedurePointer3 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint3, i32 0, i32 15
    %loadedProcedure3 = load i1(%Tree*, %Tree*, %Tree*)*, i1(%Tree*, %Tree*, %Tree*)** %procedurePointer3
    %t4 = load %Tree*, %Tree** %p_node1
    %t5 = load %Tree*, %Tree** %c_node1
    %RemoveRight_result = call i1 %loadedProcedure3(%Tree* %this, %Tree* %t4, %Tree* %t5)
    store i1 %RemoveRight_result, i1* %ntb
    ;215 end statement: ntb = this.RemoveRight(p_node, c_node);
    br label %endif1
    
ifFalse1:
    ;214 start statement : {
    ;217 start statement : auxkey1 = c_node.GetKey();
    %t6 = load %Tree*, %Tree** %c_node1
    %vTablePointer4 = getelementptr %Tree, %Tree* %t6, i32 0, i32 0
    %vTablePoint4 = load %vTable_Tree*, %vTable_Tree** %vTablePointer4
    %procedurePointer4 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint4, i32 0, i32 5
    %loadedProcedure4 = load i32(%Tree*)*, i32(%Tree*)** %procedurePointer4
    %GetKey_result = call i32 %loadedProcedure4(%Tree* %t6)
    store i32 %GetKey_result, i32* %auxkey1
    ;217 end statement: auxkey1 = c_node.GetKey();
    ;220 start statement : auxkey2 = p_node.GetLeft().GetKey();
    %t7 = load %Tree*, %Tree** %p_node1
    %vTablePointer5 = getelementptr %Tree, %Tree* %t7, i32 0, i32 0
    %vTablePoint5 = load %vTable_Tree*, %vTable_Tree** %vTablePointer5
    %procedurePointer5 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint5, i32 0, i32 4
    %loadedProcedure5 = load %Tree*(%Tree*)*, %Tree*(%Tree*)** %procedurePointer5
    %GetLeft_result = call %Tree* %loadedProcedure5(%Tree* %t7)
    %vTablePointer6 = getelementptr %Tree, %Tree* %GetLeft_result, i32 0, i32 0
    %vTablePoint6 = load %vTable_Tree*, %vTable_Tree** %vTablePointer6
    %procedurePointer6 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint6, i32 0, i32 5
    %loadedProcedure6 = load i32(%Tree*)*, i32(%Tree*)** %procedurePointer6
    %GetKey_result1 = call i32 %loadedProcedure6(%Tree* %GetLeft_result)
    store i32 %GetKey_result1, i32* %auxkey2
    ;220 end statement: auxkey2 = p_node.GetLeft().GetKey();
    ;221 start statement : if (this.Compare(auxkey1, auxkey2)) {
    %vTablePointer7 = getelementptr %Tree, %Tree* %this, i32 0, i32 0
    %vTablePoint7 = load %vTable_Tree*, %vTable_Tree** %vTablePointer7
    %procedurePointer7 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint7, i32 0, i32 11
    %loadedProcedure7 = load i1(%Tree*, i32, i32)*, i1(%Tree*, i32, i32)** %procedurePointer7
    %t8 = load i32, i32* %auxkey1
    %t9 = load i32, i32* %auxkey2
    %Compare_result = call i1 %loadedProcedure7(%Tree* %this, i32 %t8, i32 %t9)
    br i1 %Compare_result, label %ifTrue2, label %ifFalse2
    
ifTrue2:
    ;221 start statement : {
    ;222 start statement : ntb = p_node.SetLeft(my_null);
    %t10 = load %Tree*, %Tree** %p_node1
    %vTablePointer8 = getelementptr %Tree, %Tree* %t10, i32 0, i32 0
    %vTablePoint8 = load %vTable_Tree*, %vTable_Tree** %vTablePointer8
    %procedurePointer8 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint8, i32 0, i32 2
    %loadedProcedure8 = load i1(%Tree*, %Tree*)*, i1(%Tree*, %Tree*)** %procedurePointer8
    %res = getelementptr %Tree, %Tree* %this, i32 0, i32 6
    %t11 = load %Tree*, %Tree** %res
    %SetLeft_result = call i1 %loadedProcedure8(%Tree* %t10, %Tree* %t11)
    store i1 %SetLeft_result, i1* %ntb
    ;222 end statement: ntb = p_node.SetLeft(my_null);
    ;223 start statement : ntb = p_node.SetHas_Left(false);
    %t12 = load %Tree*, %Tree** %p_node1
    %vTablePointer9 = getelementptr %Tree, %Tree* %t12, i32 0, i32 0
    %vTablePoint9 = load %vTable_Tree*, %vTable_Tree** %vTablePointer9
    %procedurePointer9 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint9, i32 0, i32 9
    %loadedProcedure9 = load i1(%Tree*, i1)*, i1(%Tree*, i1)** %procedurePointer9
    %SetHas_Left_result = call i1 %loadedProcedure9(%Tree* %t12, i1 0)
    store i1 %SetHas_Left_result, i1* %ntb
    ;223 end statement: ntb = p_node.SetHas_Left(false);
    ;221 end statement: {
    br label %endif
    
ifFalse2:
    ;221 start statement : {
    ;225 start statement : ntb = p_node.SetRight(my_null);
    %t13 = load %Tree*, %Tree** %p_node1
    %vTablePointer10 = getelementptr %Tree, %Tree* %t13, i32 0, i32 0
    %vTablePoint10 = load %vTable_Tree*, %vTable_Tree** %vTablePointer10
    %procedurePointer10 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint10, i32 0, i32 1
    %loadedProcedure10 = load i1(%Tree*, %Tree*)*, i1(%Tree*, %Tree*)** %procedurePointer10
    %res1 = getelementptr %Tree, %Tree* %this, i32 0, i32 6
    %t14 = load %Tree*, %Tree** %res1
    %SetRight_result = call i1 %loadedProcedure10(%Tree* %t13, %Tree* %t14)
    store i1 %SetRight_result, i1* %ntb
    ;225 end statement: ntb = p_node.SetRight(my_null);
    ;226 start statement : ntb = p_node.SetHas_Right(false);
    %t15 = load %Tree*, %Tree** %p_node1
    %vTablePointer11 = getelementptr %Tree, %Tree* %t15, i32 0, i32 0
    %vTablePoint11 = load %vTable_Tree*, %vTable_Tree** %vTablePointer11
    %procedurePointer11 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint11, i32 0, i32 10
    %loadedProcedure11 = load i1(%Tree*, i1)*, i1(%Tree*, i1)** %procedurePointer11
    %SetHas_Right_result = call i1 %loadedProcedure11(%Tree* %t15, i1 0)
    store i1 %SetHas_Right_result, i1* %ntb
    ;226 end statement: ntb = p_node.SetHas_Right(false);
    ;221 end statement: {
    br label %endif
    
endif:
    ;221 end statement: if (this.Compare(auxkey1, auxkey2)) {
    ;214 end statement: {
    br label %endif1
    
endif1:
    ;214 end statement: if (c_node.GetHas_Right()) ntb = this.RemoveRight(p_node, c_node);
    br label %endif2
    
endif2:
    ;212 end statement: if (c_node.GetHas_Left()) ntb = this.RemoveLeft(p_node, c_node);
    ;229 start statement : return true;
    ret i1 1
    

}

define i1 @RemoveRight(%Tree* %this, %Tree* %p_node, %Tree* %c_node) {
initMethod:
    %p_node1 = alloca %Tree*
    store %Tree* %p_node, %Tree** %p_node1
    %c_node1 = alloca %Tree*
    store %Tree* %c_node, %Tree** %c_node1
    %ntb = alloca i1
    ;235 start statement : {
    ;236 start statement : boolean ntb
    ;236 end statement: boolean ntb
    ;238 start statement : while (c_node.GetHas_Right()) {
    br label %whileStart
    
whileStart:
    %t = load %Tree*, %Tree** %c_node1
    %vTablePointer = getelementptr %Tree, %Tree* %t, i32 0, i32 0
    %vTablePoint = load %vTable_Tree*, %vTable_Tree** %vTablePointer
    %procedurePointer = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint, i32 0, i32 7
    %loadedProcedure = load i1(%Tree*)*, i1(%Tree*)** %procedurePointer
    %GetHas_Right_result = call i1 %loadedProcedure(%Tree* %t)
    br i1 %GetHas_Right_result, label %loopBodyStart, label %endloop
    
loopBodyStart:
    ;238 start statement : {
    ;242 start statement : ntb = c_node.SetKey(c_node.GetRight().GetKey());
    %t1 = load %Tree*, %Tree** %c_node1
    %vTablePointer1 = getelementptr %Tree, %Tree* %t1, i32 0, i32 0
    %vTablePoint1 = load %vTable_Tree*, %vTable_Tree** %vTablePointer1
    %procedurePointer1 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint1, i32 0, i32 6
    %loadedProcedure1 = load i1(%Tree*, i32)*, i1(%Tree*, i32)** %procedurePointer1
    %t2 = load %Tree*, %Tree** %c_node1
    %vTablePointer2 = getelementptr %Tree, %Tree* %t2, i32 0, i32 0
    %vTablePoint2 = load %vTable_Tree*, %vTable_Tree** %vTablePointer2
    %procedurePointer2 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint2, i32 0, i32 3
    %loadedProcedure2 = load %Tree*(%Tree*)*, %Tree*(%Tree*)** %procedurePointer2
    %GetRight_result = call %Tree* %loadedProcedure2(%Tree* %t2)
    %vTablePointer3 = getelementptr %Tree, %Tree* %GetRight_result, i32 0, i32 0
    %vTablePoint3 = load %vTable_Tree*, %vTable_Tree** %vTablePointer3
    %procedurePointer3 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint3, i32 0, i32 5
    %loadedProcedure3 = load i32(%Tree*)*, i32(%Tree*)** %procedurePointer3
    %GetKey_result = call i32 %loadedProcedure3(%Tree* %GetRight_result)
    %SetKey_result = call i1 %loadedProcedure1(%Tree* %t1, i32 %GetKey_result)
    store i1 %SetKey_result, i1* %ntb
    ;242 end statement: ntb = c_node.SetKey(c_node.GetRight().GetKey());
    ;243 start statement : p_node = c_node;
    %t3 = load %Tree*, %Tree** %c_node1
    store %Tree* %t3, %Tree** %p_node1
    ;243 end statement: p_node = c_node;
    ;244 start statement : c_node = c_node.GetRight();
    %t4 = load %Tree*, %Tree** %c_node1
    %vTablePointer4 = getelementptr %Tree, %Tree* %t4, i32 0, i32 0
    %vTablePoint4 = load %vTable_Tree*, %vTable_Tree** %vTablePointer4
    %procedurePointer4 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint4, i32 0, i32 3
    %loadedProcedure4 = load %Tree*(%Tree*)*, %Tree*(%Tree*)** %procedurePointer4
    %GetRight_result1 = call %Tree* %loadedProcedure4(%Tree* %t4)
    store %Tree* %GetRight_result1, %Tree** %c_node1
    ;244 end statement: c_node = c_node.GetRight();
    ;238 end statement: {
    br label %whileStart
    
endloop:
    ;238 end statement: while (c_node.GetHas_Right()) {
    ;246 start statement : ntb = p_node.SetRight(my_null);
    %t5 = load %Tree*, %Tree** %p_node1
    %vTablePointer5 = getelementptr %Tree, %Tree* %t5, i32 0, i32 0
    %vTablePoint5 = load %vTable_Tree*, %vTable_Tree** %vTablePointer5
    %procedurePointer5 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint5, i32 0, i32 1
    %loadedProcedure5 = load i1(%Tree*, %Tree*)*, i1(%Tree*, %Tree*)** %procedurePointer5
    %res = getelementptr %Tree, %Tree* %this, i32 0, i32 6
    %t6 = load %Tree*, %Tree** %res
    %SetRight_result = call i1 %loadedProcedure5(%Tree* %t5, %Tree* %t6)
    store i1 %SetRight_result, i1* %ntb
    ;246 end statement: ntb = p_node.SetRight(my_null);
    ;247 start statement : ntb = p_node.SetHas_Right(false);
    %t7 = load %Tree*, %Tree** %p_node1
    %vTablePointer6 = getelementptr %Tree, %Tree* %t7, i32 0, i32 0
    %vTablePoint6 = load %vTable_Tree*, %vTable_Tree** %vTablePointer6
    %procedurePointer6 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint6, i32 0, i32 10
    %loadedProcedure6 = load i1(%Tree*, i1)*, i1(%Tree*, i1)** %procedurePointer6
    %SetHas_Right_result = call i1 %loadedProcedure6(%Tree* %t7, i1 0)
    store i1 %SetHas_Right_result, i1* %ntb
    ;247 end statement: ntb = p_node.SetHas_Right(false);
    ;248 start statement : return true;
    ret i1 1
    

}

define i1 @RemoveLeft(%Tree* %this, %Tree* %p_node, %Tree* %c_node) {
initMethod:
    %p_node1 = alloca %Tree*
    store %Tree* %p_node, %Tree** %p_node1
    %c_node1 = alloca %Tree*
    store %Tree* %c_node, %Tree** %c_node1
    %ntb = alloca i1
    ;254 start statement : {
    ;255 start statement : boolean ntb
    ;255 end statement: boolean ntb
    ;257 start statement : while (c_node.GetHas_Left()) {
    br label %whileStart
    
whileStart:
    %t = load %Tree*, %Tree** %c_node1
    %vTablePointer = getelementptr %Tree, %Tree* %t, i32 0, i32 0
    %vTablePoint = load %vTable_Tree*, %vTable_Tree** %vTablePointer
    %procedurePointer = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint, i32 0, i32 8
    %loadedProcedure = load i1(%Tree*)*, i1(%Tree*)** %procedurePointer
    %GetHas_Left_result = call i1 %loadedProcedure(%Tree* %t)
    br i1 %GetHas_Left_result, label %loopBodyStart, label %endloop
    
loopBodyStart:
    ;257 start statement : {
    ;261 start statement : ntb = c_node.SetKey(c_node.GetLeft().GetKey());
    %t1 = load %Tree*, %Tree** %c_node1
    %vTablePointer1 = getelementptr %Tree, %Tree* %t1, i32 0, i32 0
    %vTablePoint1 = load %vTable_Tree*, %vTable_Tree** %vTablePointer1
    %procedurePointer1 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint1, i32 0, i32 6
    %loadedProcedure1 = load i1(%Tree*, i32)*, i1(%Tree*, i32)** %procedurePointer1
    %t2 = load %Tree*, %Tree** %c_node1
    %vTablePointer2 = getelementptr %Tree, %Tree* %t2, i32 0, i32 0
    %vTablePoint2 = load %vTable_Tree*, %vTable_Tree** %vTablePointer2
    %procedurePointer2 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint2, i32 0, i32 4
    %loadedProcedure2 = load %Tree*(%Tree*)*, %Tree*(%Tree*)** %procedurePointer2
    %GetLeft_result = call %Tree* %loadedProcedure2(%Tree* %t2)
    %vTablePointer3 = getelementptr %Tree, %Tree* %GetLeft_result, i32 0, i32 0
    %vTablePoint3 = load %vTable_Tree*, %vTable_Tree** %vTablePointer3
    %procedurePointer3 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint3, i32 0, i32 5
    %loadedProcedure3 = load i32(%Tree*)*, i32(%Tree*)** %procedurePointer3
    %GetKey_result = call i32 %loadedProcedure3(%Tree* %GetLeft_result)
    %SetKey_result = call i1 %loadedProcedure1(%Tree* %t1, i32 %GetKey_result)
    store i1 %SetKey_result, i1* %ntb
    ;261 end statement: ntb = c_node.SetKey(c_node.GetLeft().GetKey());
    ;262 start statement : p_node = c_node;
    %t3 = load %Tree*, %Tree** %c_node1
    store %Tree* %t3, %Tree** %p_node1
    ;262 end statement: p_node = c_node;
    ;263 start statement : c_node = c_node.GetLeft();
    %t4 = load %Tree*, %Tree** %c_node1
    %vTablePointer4 = getelementptr %Tree, %Tree* %t4, i32 0, i32 0
    %vTablePoint4 = load %vTable_Tree*, %vTable_Tree** %vTablePointer4
    %procedurePointer4 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint4, i32 0, i32 4
    %loadedProcedure4 = load %Tree*(%Tree*)*, %Tree*(%Tree*)** %procedurePointer4
    %GetLeft_result1 = call %Tree* %loadedProcedure4(%Tree* %t4)
    store %Tree* %GetLeft_result1, %Tree** %c_node1
    ;263 end statement: c_node = c_node.GetLeft();
    ;257 end statement: {
    br label %whileStart
    
endloop:
    ;257 end statement: while (c_node.GetHas_Left()) {
    ;265 start statement : ntb = p_node.SetLeft(my_null);
    %t5 = load %Tree*, %Tree** %p_node1
    %vTablePointer5 = getelementptr %Tree, %Tree* %t5, i32 0, i32 0
    %vTablePoint5 = load %vTable_Tree*, %vTable_Tree** %vTablePointer5
    %procedurePointer5 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint5, i32 0, i32 2
    %loadedProcedure5 = load i1(%Tree*, %Tree*)*, i1(%Tree*, %Tree*)** %procedurePointer5
    %res = getelementptr %Tree, %Tree* %this, i32 0, i32 6
    %t6 = load %Tree*, %Tree** %res
    %SetLeft_result = call i1 %loadedProcedure5(%Tree* %t5, %Tree* %t6)
    store i1 %SetLeft_result, i1* %ntb
    ;265 end statement: ntb = p_node.SetLeft(my_null);
    ;266 start statement : ntb = p_node.SetHas_Left(false);
    %t7 = load %Tree*, %Tree** %p_node1
    %vTablePointer6 = getelementptr %Tree, %Tree* %t7, i32 0, i32 0
    %vTablePoint6 = load %vTable_Tree*, %vTable_Tree** %vTablePointer6
    %procedurePointer6 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint6, i32 0, i32 9
    %loadedProcedure6 = load i1(%Tree*, i1)*, i1(%Tree*, i1)** %procedurePointer6
    %SetHas_Left_result = call i1 %loadedProcedure6(%Tree* %t7, i1 0)
    store i1 %SetHas_Left_result, i1* %ntb
    ;266 end statement: ntb = p_node.SetHas_Left(false);
    ;267 start statement : return true;
    ret i1 1
    

}

define i32 @Search(%Tree* %this, i32 %v_key) {
initMethod:
    %v_key1 = alloca i32
    store i32 %v_key, i32* %v_key1
    %cont = alloca i1
    %ifound = alloca i32
    %current_node = alloca %Tree*
    %key_aux = alloca i32
    ;271 start statement : {
    ;272 start statement : boolean cont
    ;272 end statement: boolean cont
    ;273 start statement : int ifound
    ;273 end statement: int ifound
    ;274 start statement : Tree current_node
    ;274 end statement: Tree current_node
    ;275 start statement : int key_aux
    ;275 end statement: int key_aux
    ;277 start statement : printInt(500001);
    call void @print(i32 500001)
    ;277 end statement: printInt(500001);
    ;278 start statement : current_node = this;
    store %Tree* %this, %Tree** %current_node
    ;278 end statement: current_node = this;
    ;279 start statement : cont = true;
    store i1 1, i1* %cont
    ;279 end statement: cont = true;
    ;280 start statement : ifound = 0;
    store i32 0, i32* %ifound
    ;280 end statement: ifound = 0;
    ;281 start statement : printInt(500002);
    call void @print(i32 500002)
    ;281 end statement: printInt(500002);
    ;282 start statement : while (cont) {
    br label %whileStart
    
whileStart:
    %t = load i1, i1* %cont
    br i1 %t, label %loopBodyStart, label %endloop
    
loopBodyStart:
    ;282 start statement : {
    ;283 start statement : key_aux = current_node.GetKey();
    %t1 = load %Tree*, %Tree** %current_node
    %vTablePointer = getelementptr %Tree, %Tree* %t1, i32 0, i32 0
    %vTablePoint = load %vTable_Tree*, %vTable_Tree** %vTablePointer
    %procedurePointer = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint, i32 0, i32 5
    %loadedProcedure = load i32(%Tree*)*, i32(%Tree*)** %procedurePointer
    %GetKey_result = call i32 %loadedProcedure(%Tree* %t1)
    store i32 %GetKey_result, i32* %key_aux
    ;283 end statement: key_aux = current_node.GetKey();
    ;284 start statement : if ((v_key < key_aux)) {
    %t2 = load i32, i32* %v_key1
    %t3 = load i32, i32* %key_aux
    %resSltImpl = icmp slt i32 %t2, %t3
    br i1 %resSltImpl, label %ifTrue, label %ifFalse1
    
ifTrue:
    ;284 start statement : {
    ;285 start statement : if (current_node.GetHas_Left()) {
    %t4 = load %Tree*, %Tree** %current_node
    %vTablePointer1 = getelementptr %Tree, %Tree* %t4, i32 0, i32 0
    %vTablePoint1 = load %vTable_Tree*, %vTable_Tree** %vTablePointer1
    %procedurePointer1 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint1, i32 0, i32 8
    %loadedProcedure1 = load i1(%Tree*)*, i1(%Tree*)** %procedurePointer1
    %GetHas_Left_result = call i1 %loadedProcedure1(%Tree* %t4)
    br i1 %GetHas_Left_result, label %ifTrue1, label %ifFalse
    
ifTrue1:
    ;285 start statement : {
    ;286 start statement : printInt(55511);
    call void @print(i32 55511)
    ;286 end statement: printInt(55511);
    ;287 start statement : current_node = current_node.GetLeft();
    %t5 = load %Tree*, %Tree** %current_node
    %vTablePointer2 = getelementptr %Tree, %Tree* %t5, i32 0, i32 0
    %vTablePoint2 = load %vTable_Tree*, %vTable_Tree** %vTablePointer2
    %procedurePointer2 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint2, i32 0, i32 4
    %loadedProcedure2 = load %Tree*(%Tree*)*, %Tree*(%Tree*)** %procedurePointer2
    %GetLeft_result = call %Tree* %loadedProcedure2(%Tree* %t5)
    store %Tree* %GetLeft_result, %Tree** %current_node
    ;287 end statement: current_node = current_node.GetLeft();
    ;285 end statement: {
    br label %endif
    
ifFalse:
    ;285 start statement : {
    ;289 start statement : printInt(55510);
    call void @print(i32 55510)
    ;289 end statement: printInt(55510);
    ;290 start statement : cont = false;
    store i1 0, i1* %cont
    ;290 end statement: cont = false;
    ;285 end statement: {
    br label %endif
    
endif:
    ;285 end statement: if (current_node.GetHas_Left()) {
    ;284 end statement: {
    br label %endif3
    
ifFalse1:
    ;292 start statement : if ((key_aux < v_key)) {
    %t6 = load i32, i32* %key_aux
    %t7 = load i32, i32* %v_key1
    %resSltImpl1 = icmp slt i32 %t6, %t7
    br i1 %resSltImpl1, label %ifTrue2, label %ifFalse3
    
ifTrue2:
    ;292 start statement : {
    ;293 start statement : if (current_node.GetHas_Right()) {
    %t8 = load %Tree*, %Tree** %current_node
    %vTablePointer3 = getelementptr %Tree, %Tree* %t8, i32 0, i32 0
    %vTablePoint3 = load %vTable_Tree*, %vTable_Tree** %vTablePointer3
    %procedurePointer3 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint3, i32 0, i32 7
    %loadedProcedure3 = load i1(%Tree*)*, i1(%Tree*)** %procedurePointer3
    %GetHas_Right_result = call i1 %loadedProcedure3(%Tree* %t8)
    br i1 %GetHas_Right_result, label %ifTrue3, label %ifFalse2
    
ifTrue3:
    ;293 start statement : {
    ;294 start statement : printInt(55011);
    call void @print(i32 55011)
    ;294 end statement: printInt(55011);
    ;295 start statement : current_node = current_node.GetRight();
    %t9 = load %Tree*, %Tree** %current_node
    %vTablePointer4 = getelementptr %Tree, %Tree* %t9, i32 0, i32 0
    %vTablePoint4 = load %vTable_Tree*, %vTable_Tree** %vTablePointer4
    %procedurePointer4 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint4, i32 0, i32 3
    %loadedProcedure4 = load %Tree*(%Tree*)*, %Tree*(%Tree*)** %procedurePointer4
    %GetRight_result = call %Tree* %loadedProcedure4(%Tree* %t9)
    store %Tree* %GetRight_result, %Tree** %current_node
    ;295 end statement: current_node = current_node.GetRight();
    ;293 end statement: {
    br label %endif1
    
ifFalse2:
    ;293 start statement : {
    ;297 start statement : printInt(555010);
    call void @print(i32 555010)
    ;297 end statement: printInt(555010);
    ;298 start statement : cont = false;
    store i1 0, i1* %cont
    ;298 end statement: cont = false;
    ;293 end statement: {
    br label %endif1
    
endif1:
    ;293 end statement: if (current_node.GetHas_Right()) {
    ;292 end statement: {
    br label %endif2
    
ifFalse3:
    ;292 start statement : {
    ;301 start statement : printInt(555500);
    call void @print(i32 555500)
    ;301 end statement: printInt(555500);
    ;302 start statement : ifound = 1;
    store i32 1, i32* %ifound
    ;302 end statement: ifound = 1;
    ;303 start statement : cont = false;
    store i1 0, i1* %cont
    ;303 end statement: cont = false;
    ;292 end statement: {
    br label %endif2
    
endif2:
    ;292 end statement: if ((key_aux < v_key)) {
    br label %endif3
    
endif3:
    ;284 end statement: if ((v_key < key_aux)) {
    ;305 start statement : printInt(ifound);
    %t10 = load i32, i32* %ifound
    call void @print(i32 %t10)
    ;305 end statement: printInt(ifound);
    ;282 end statement: {
    br label %whileStart
    
endloop:
    ;282 end statement: while (cont) {
    ;307 start statement : printInt(ifound);
    %t11 = load i32, i32* %ifound
    call void @print(i32 %t11)
    ;307 end statement: printInt(ifound);
    ;308 start statement : printInt(500004);
    call void @print(i32 500004)
    ;308 end statement: printInt(500004);
    ;309 start statement : return ifound;
    %t12 = load i32, i32* %ifound
    ret i32 %t12
    

}

define i1 @Print(%Tree* %this) {
initMethod:
    %current_node = alloca %Tree*
    %ntb = alloca i1
    ;313 start statement : {
    ;314 start statement : Tree current_node
    ;314 end statement: Tree current_node
    ;315 start statement : boolean ntb
    ;315 end statement: boolean ntb
    ;317 start statement : current_node = this;
    store %Tree* %this, %Tree** %current_node
    ;317 end statement: current_node = this;
    ;318 start statement : ntb = this.RecPrint(current_node);
    %vTablePointer = getelementptr %Tree, %Tree* %this, i32 0, i32 0
    %vTablePoint = load %vTable_Tree*, %vTable_Tree** %vTablePointer
    %procedurePointer = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint, i32 0, i32 19
    %loadedProcedure = load i1(%Tree*, %Tree*)*, i1(%Tree*, %Tree*)** %procedurePointer
    %t = load %Tree*, %Tree** %current_node
    %RecPrint_result = call i1 %loadedProcedure(%Tree* %this, %Tree* %t)
    store i1 %RecPrint_result, i1* %ntb
    ;318 end statement: ntb = this.RecPrint(current_node);
    ;319 start statement : return true;
    ret i1 1
    

}

define i1 @RecPrint(%Tree* %this, %Tree* %node) {
initMethod:
    %node1 = alloca %Tree*
    store %Tree* %node, %Tree** %node1
    %ntb = alloca i1
    ;323 start statement : {
    ;324 start statement : boolean ntb
    ;324 end statement: boolean ntb
    ;326 start statement : if (node.GetHas_Left()) {
    %t = load %Tree*, %Tree** %node1
    %vTablePointer = getelementptr %Tree, %Tree* %t, i32 0, i32 0
    %vTablePoint = load %vTable_Tree*, %vTable_Tree** %vTablePointer
    %procedurePointer = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint, i32 0, i32 8
    %loadedProcedure = load i1(%Tree*)*, i1(%Tree*)** %procedurePointer
    %GetHas_Left_result = call i1 %loadedProcedure(%Tree* %t)
    br i1 %GetHas_Left_result, label %ifTrue, label %ifFalse
    
ifTrue:
    ;326 start statement : {
    ;329 start statement : ntb = this.RecPrint(node.GetLeft());
    %vTablePointer1 = getelementptr %Tree, %Tree* %this, i32 0, i32 0
    %vTablePoint1 = load %vTable_Tree*, %vTable_Tree** %vTablePointer1
    %procedurePointer1 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint1, i32 0, i32 19
    %loadedProcedure1 = load i1(%Tree*, %Tree*)*, i1(%Tree*, %Tree*)** %procedurePointer1
    %t1 = load %Tree*, %Tree** %node1
    %vTablePointer2 = getelementptr %Tree, %Tree* %t1, i32 0, i32 0
    %vTablePoint2 = load %vTable_Tree*, %vTable_Tree** %vTablePointer2
    %procedurePointer2 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint2, i32 0, i32 4
    %loadedProcedure2 = load %Tree*(%Tree*)*, %Tree*(%Tree*)** %procedurePointer2
    %GetLeft_result = call %Tree* %loadedProcedure2(%Tree* %t1)
    %RecPrint_result = call i1 %loadedProcedure1(%Tree* %this, %Tree* %GetLeft_result)
    store i1 %RecPrint_result, i1* %ntb
    ;329 end statement: ntb = this.RecPrint(node.GetLeft());
    ;326 end statement: {
    br label %endif
    
ifFalse:
    ;331 start statement : ntb = true;
    store i1 1, i1* %ntb
    ;331 end statement: ntb = true;
    br label %endif
    
endif:
    ;326 end statement: if (node.GetHas_Left()) {
    ;332 start statement : printInt(node.GetKey());
    %t2 = load %Tree*, %Tree** %node1
    %vTablePointer3 = getelementptr %Tree, %Tree* %t2, i32 0, i32 0
    %vTablePoint3 = load %vTable_Tree*, %vTable_Tree** %vTablePointer3
    %procedurePointer3 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint3, i32 0, i32 5
    %loadedProcedure3 = load i32(%Tree*)*, i32(%Tree*)** %procedurePointer3
    %GetKey_result = call i32 %loadedProcedure3(%Tree* %t2)
    call void @print(i32 %GetKey_result)
    ;332 end statement: printInt(node.GetKey());
    ;333 start statement : if (node.GetHas_Right()) {
    %t3 = load %Tree*, %Tree** %node1
    %vTablePointer4 = getelementptr %Tree, %Tree* %t3, i32 0, i32 0
    %vTablePoint4 = load %vTable_Tree*, %vTable_Tree** %vTablePointer4
    %procedurePointer4 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint4, i32 0, i32 7
    %loadedProcedure4 = load i1(%Tree*)*, i1(%Tree*)** %procedurePointer4
    %GetHas_Right_result = call i1 %loadedProcedure4(%Tree* %t3)
    br i1 %GetHas_Right_result, label %ifTrue1, label %ifFalse1
    
ifTrue1:
    ;333 start statement : {
    ;336 start statement : ntb = this.RecPrint(node.GetRight());
    %vTablePointer5 = getelementptr %Tree, %Tree* %this, i32 0, i32 0
    %vTablePoint5 = load %vTable_Tree*, %vTable_Tree** %vTablePointer5
    %procedurePointer5 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint5, i32 0, i32 19
    %loadedProcedure5 = load i1(%Tree*, %Tree*)*, i1(%Tree*, %Tree*)** %procedurePointer5
    %t4 = load %Tree*, %Tree** %node1
    %vTablePointer6 = getelementptr %Tree, %Tree* %t4, i32 0, i32 0
    %vTablePoint6 = load %vTable_Tree*, %vTable_Tree** %vTablePointer6
    %procedurePointer6 = getelementptr %vTable_Tree, %vTable_Tree* %vTablePoint6, i32 0, i32 3
    %loadedProcedure6 = load %Tree*(%Tree*)*, %Tree*(%Tree*)** %procedurePointer6
    %GetRight_result = call %Tree* %loadedProcedure6(%Tree* %t4)
    %RecPrint_result1 = call i1 %loadedProcedure5(%Tree* %this, %Tree* %GetRight_result)
    store i1 %RecPrint_result1, i1* %ntb
    ;336 end statement: ntb = this.RecPrint(node.GetRight());
    ;333 end statement: {
    br label %endif1
    
ifFalse1:
    ;338 start statement : ntb = true;
    store i1 1, i1* %ntb
    ;338 end statement: ntb = true;
    br label %endif1
    
endif1:
    ;333 end statement: if (node.GetHas_Right()) {
    ;339 start statement : return true;
    ret i1 1
    

}

define %BT* @"Create BT"() {
"Constr class BT":
    %"struct BT" = call i8* @malloc(i32 ptrtoint (%BT* getelementptr (%BT, %BT* null, i32 1) to i32))
    %"classPointer BT" = bitcast i8* %"struct BT" to %BT*
    %ffAdress = getelementptr %BT, %BT* %"classPointer BT", i32 0, i32 0
    store %vTable_BT* @vTable_BT1, %vTable_BT** %ffAdress
    ret %BT* %"classPointer BT"
    

}

define %Tree* @"Create Tree"() {
"Constr class Tree":
    %"struct Tree" = call i8* @malloc(i32 ptrtoint (%Tree* getelementptr (%Tree, %Tree* null, i32 1) to i32))
    %"classPointer Tree" = bitcast i8* %"struct Tree" to %Tree*
    %ffAdress = getelementptr %Tree, %Tree* %"classPointer Tree", i32 0, i32 0
    store %vTable_Tree* @vTable_Tree1, %vTable_Tree** %ffAdress
    %addres = getelementptr %Tree, %Tree* %"classPointer Tree", i32 0, i32 1
    store %Tree* null, %Tree** %addres
    %addres1 = getelementptr %Tree, %Tree* %"classPointer Tree", i32 0, i32 2
    store %Tree* null, %Tree** %addres1
    %addres2 = getelementptr %Tree, %Tree* %"classPointer Tree", i32 0, i32 3
    store i32 0, i32* %addres2
    %addres3 = getelementptr %Tree, %Tree* %"classPointer Tree", i32 0, i32 4
    store i1 0, i1* %addres3
    %addres4 = getelementptr %Tree, %Tree* %"classPointer Tree", i32 0, i32 5
    store i1 0, i1* %addres4
    %addres5 = getelementptr %Tree, %Tree* %"classPointer Tree", i32 0, i32 6
    store %Tree* null, %Tree** %addres5
    ret %Tree* %"classPointer Tree"
    

}

define i32 @main() {
init:
    ;1 start statement : {
    ;2 start statement : printInt(new BT().Start());
    %constrRes = call %BT* @"Create BT"()
    %vTablePointer = getelementptr %BT, %BT* %constrRes, i32 0, i32 0
    %vTablePoint = load %vTable_BT*, %vTable_BT** %vTablePointer
    %procedurePointer = getelementptr %vTable_BT, %vTable_BT* %vTablePoint, i32 0, i32 0
    %loadedProcedure = load i32(%BT*)*, i32(%BT*)** %procedurePointer
    %Start_result = call i32 %loadedProcedure(%BT* %constrRes)
    call void @print(i32 %Start_result)
    ;2 end statement: printInt(new BT().Start());
    ;3 start statement : return 0;
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
