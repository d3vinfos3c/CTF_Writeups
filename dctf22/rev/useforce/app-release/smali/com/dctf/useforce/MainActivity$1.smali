.class Lcom/dctf/useforce/MainActivity$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dctf/useforce/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dctf/useforce/MainActivity;

.field final synthetic val$editText:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/dctf/useforce/MainActivity;Landroid/widget/EditText;)V
    .locals 0

    .line 36
    iput-object p1, p0, Lcom/dctf/useforce/MainActivity$1;->this$0:Lcom/dctf/useforce/MainActivity;

    iput-object p2, p0, Lcom/dctf/useforce/MainActivity$1;->val$editText:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 39
    iget-object p1, p0, Lcom/dctf/useforce/MainActivity$1;->val$editText:Landroid/widget/EditText;

    const-string v0, ""

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
