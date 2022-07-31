.class public LP2;
.super Ljava/lang/Object;
.source "P2.java"

.method public constructor <init>()V
  .registers 1
  .prologue
  .line 7
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static getDigit(I)I
  .registers 3
  .prologue
  .line 77
    mul-int/lit8 v0, p0, 2
  .line 78
    div-int/lit8 v1, v0, 10
    rem-int/lit8 v0, v0, 10
    add-int/2addr v0, v1
    return v0
.end method

.method public static getPrefix(JI)J
  .registers 7
  .prologue
  .line 114
    invoke-static { p0, p1 }, LP2;->getSize(J)I
    move-result v0
  .line 116
    const-wide/high16 v2, 16420
    sub-int/2addr v0, p2
    int-to-double v0, v0
    invoke-static { v2, v3, v0, v1 }, Ljava/lang/Math;->pow(DD)D
    move-result-wide v0
    double-to-long v0, v0
    div-long v0, p0, v0
  .line 118
    return-wide v0
.end method

.method public static getSize(J)I
  .registers 6
  .prologue
  .line 99
    const/4 v0, 0
  :L0
  .line 101
    const-wide/16 v2, 0
    cmp-long v1, p0, v2
    if-nez v1, :L1
  .line 105
    return v0
  :L1
  .line 102
    add-int/lit8 v0, v0, 1
  .line 103
    const-wide/16 v2, 10
    div-long/2addr p0, v2
    goto :L0
.end method

.method public static isValid(J)Z
  .registers 8
  .prologue
    const/4 v0, 0
  .line 46
    long-to-double v2, p0
    const-wide v4, 4846369599423283200L
    cmpl-double v1, v2, v4
    if-gtz v1, :L0
    long-to-double v2, p0
    const-wide v4, 4801453603149578240L
    cmpg-double v1, v2, v4
    if-gez v1, :L1
  :L0
  .line 59
    return v0
  :L1
  .line 51
    const/4 v1, 4
    invoke-static { p0, p1, v1 }, LP2;->prefixMatched(JI)Z
    move-result v1
    if-nez v1, :L2
  .line 52
    const/4 v1, 5
    invoke-static { p0, p1, v1 }, LP2;->prefixMatched(JI)Z
    move-result v1
    if-nez v1, :L2
  .line 53
    const/4 v1, 6
    invoke-static { p0, p1, v1 }, LP2;->prefixMatched(JI)Z
    move-result v1
    if-nez v1, :L2
  .line 54
    const/16 v1, 37
    invoke-static { p0, p1, v1 }, LP2;->prefixMatched(JI)Z
    move-result v1
    if-eqz v1, :L0
  :L2
  .line 58
    invoke-static { p0, p1 }, LP2;->sumOfDblEvenPlace(J)I
    move-result v1
    invoke-static { p0, p1 }, LP2;->sumOfOddPlace(J)I
    move-result v2
    add-int/2addr v1, v2
  .line 59
    rem-int/lit8 v1, v1, 10
    if-nez v1, :L0
    const/4 v0, 1
    goto :L0
.end method

.method public static main([Ljava/lang/String;)V
  .registers 9
  .prologue
    const-wide/16 v6, 0
  .line 12
    new-instance v0, Ljava/util/Scanner;
    sget-object v1, Ljava/lang/System;->in:Ljava/io/InputStream;
    invoke-direct { v0, v1 }, Ljava/util/Scanner;-><init>(Ljava/io/InputStream;)V
  :L0
  .line 18
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;
    const-string v2, "Veuillez mettre une CC (pas de format PIPE svp):  "
    invoke-virtual { v1, v2 }, Ljava/io/PrintStream;->print(Ljava/lang/String;)V
  .line 19
    invoke-virtual { v0 }, Ljava/util/Scanner;->nextLong()J
    move-result-wide v2
  .line 20
    cmp-long v1, v2, v6
    if-gez v1, :L1
  .line 21
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;
    const-string v4, "ERROR! Veuillez entrer un nombre positive"
    invoke-virtual { v1, v4 }, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
  :L1
  .line 17
    cmp-long v1, v2, v6
    if-ltz v1, :L0
  .line 24
    invoke-static { v2, v3 }, LP2;->isValid(J)Z
    move-result v1
    if-eqz v1, :L4
  .line 25
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-static { v2, v3 }, Ljava/lang/String;->valueOf(J)Ljava/lang/String;
    move-result-object v2
    invoke-direct { v4, v2 }, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    const-string v2, " est valide, et chargable."
    invoke-virtual { v4, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
  :L2
  .line 30
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;
    const-string v2, "Voulez vous encore continuer (y/n)? "
    invoke-virtual { v1, v2 }, Ljava/io/PrintStream;->print(Ljava/lang/String;)V
  .line 31
    invoke-virtual { v0 }, Ljava/util/Scanner;->next()Ljava/lang/String;
    move-result-object v1
  .line 32
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;
    const-string v3, "\n"
    invoke-virtual { v2, v3 }, Ljava/io/PrintStream;->print(Ljava/lang/String;)V
  .line 33
    const/4 v2, 0
    invoke-virtual { v1, v2 }, Ljava/lang/String;->charAt(I)C
    move-result v1
  .line 34
    const/16 v2, 110
    if-eq v1, v2, :L3
    const/16 v2, 78
    if-ne v1, v2, :L0
  :L3
  .line 36
    return-void
  :L4
  .line 27
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-static { v2, v3 }, Ljava/lang/String;->valueOf(J)Ljava/lang/String;
    move-result-object v2
    invoke-direct { v4, v2 }, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    const-string v2, " non-valide, et non-chargable."
    invoke-virtual { v4, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    goto :L2
.end method

.method public static prefixMatched(JI)Z
  .registers 7
  .prologue
  .line 93
    int-to-long v0, p2
    invoke-static { v0, v1 }, LP2;->getSize(J)I
    move-result v0
  .line 94
    invoke-static { p0, p1, v0 }, LP2;->getPrefix(JI)J
    move-result-wide v0
    int-to-long v2, p2
    cmp-long v0, v0, v2
    if-nez v0, :L1
    const/4 v0, 1
  :L0
    return v0
  :L1
    const/4 v0, 0
    goto :L0
.end method

.method public static sumOfDblEvenPlace(J)I
  .registers 10
  .prologue
    const-wide/16 v6, 10
  .line 64
    const/4 v0, 0
  .line 65
    div-long v2, p0, v6
  :L0
  .line 66
    const-wide/16 v4, 0
    cmp-long v1, v2, v4
    if-gtz v1, :L1
  .line 71
    return v0
  :L1
  .line 67
    rem-long v4, v2, v6
    long-to-int v1, v4
  .line 68
    invoke-static { v1 }, LP2;->getDigit(I)I
    move-result v1
    add-int/2addr v0, v1
  .line 69
    const-wide/16 v4, 100
    div-long/2addr v2, v4
    goto :L0
.end method

.method public static sumOfOddPlace(J)I
  .registers 6
  .prologue
  .line 83
    const/4 v0, 0
  :L0
  .line 84
    const-wide/16 v2, 0
    cmp-long v1, p0, v2
    if-gtz v1, :L1
  .line 88
    return v0
  :L1
  .line 85
    int-to-long v0, v0
    const-wide/16 v2, 10
    rem-long v2, p0, v2
    add-long/2addr v0, v2
    long-to-int v0, v0
  .line 86
    const-wide/16 v2, 100
    div-long/2addr p0, v2
    goto :L0
.end method
