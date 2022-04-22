.class public Lcom/dctf/useforce/MainActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "MainActivity.java"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "native-lib"

    .line 18
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public native a(Ljava/lang/String;)Ljava/lang/String;
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 25
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0a001c

    .line 26
    invoke-virtual {p0, p1}, Lcom/dctf/useforce/MainActivity;->setContentView(I)V

    const/4 p1, 0x2

    .line 27
    invoke-static {p1}, Landroidx/appcompat/app/AppCompatDelegate;->setDefaultNightMode(I)V

    const p1, 0x7f070077

    .line 30
    invoke-virtual {p0, p1}, Lcom/dctf/useforce/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    const v0, 0x7f070051

    .line 32
    invoke-virtual {p0, v0}, Lcom/dctf/useforce/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    const v1, 0x7f070052

    .line 34
    invoke-virtual {p0, v1}, Lcom/dctf/useforce/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 36
    new-instance v2, Lcom/dctf/useforce/MainActivity$1;

    invoke-direct {v2, p0, p1}, Lcom/dctf/useforce/MainActivity$1;-><init>(Lcom/dctf/useforce/MainActivity;Landroid/widget/EditText;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 45
    new-instance v0, Lcom/dctf/useforce/MainActivity$2;

    invoke-direct {v0, p0, p1}, Lcom/dctf/useforce/MainActivity$2;-><init>(Lcom/dctf/useforce/MainActivity;Landroid/widget/EditText;)V

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
