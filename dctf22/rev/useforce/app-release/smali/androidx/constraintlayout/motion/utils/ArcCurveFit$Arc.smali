.class Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;
.super Ljava/lang/Object;
.source "ArcCurveFit.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/motion/utils/ArcCurveFit;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Arc"
.end annotation


# static fields
.field private static final EPSILON:D = 0.001

.field private static final TAG:Ljava/lang/String; = "Arc"

.field private static ourPercent:[D


# instance fields
.field linear:Z

.field mArcDistance:D

.field mArcVelocity:D

.field mEllipseA:D

.field mEllipseB:D

.field mEllipseCenterX:D

.field mEllipseCenterY:D

.field mLut:[D

.field mOneOverDeltaTime:D

.field mTime1:D

.field mTime2:D

.field mTmpCosAngle:D

.field mTmpSinAngle:D

.field mVertical:Z

.field mX1:D

.field mX2:D

.field mY1:D

.field mY2:D


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x5b

    new-array v0, v0, [D

    .line 194
    sput-object v0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->ourPercent:[D

    return-void
.end method

.method constructor <init>(IDDDDDD)V
    .locals 20

    move-object/from16 v9, p0

    move/from16 v0, p1

    move-wide/from16 v1, p6

    move-wide/from16 v3, p8

    move-wide/from16 v5, p10

    move-wide/from16 v7, p12

    .line 212
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    const/4 v10, 0x0

    .line 209
    iput-boolean v10, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->linear:Z

    const/4 v11, 0x1

    if-ne v0, v11, :cond_0

    const/4 v10, 0x1

    .line 213
    :cond_0
    iput-boolean v10, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mVertical:Z

    move-wide/from16 v12, p2

    .line 214
    iput-wide v12, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime1:D

    move-wide/from16 v12, p4

    .line 215
    iput-wide v12, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime2:D

    const-wide/high16 v12, 0x3ff0000000000000L    # 1.0

    .line 216
    iget-wide v14, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime2:D

    iget-wide v3, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime1:D

    sub-double/2addr v14, v3

    div-double/2addr v12, v14

    iput-wide v12, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mOneOverDeltaTime:D

    const/4 v3, 0x3

    if-ne v3, v0, :cond_1

    .line 218
    iput-boolean v11, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->linear:Z

    :cond_1
    sub-double v3, v5, v1

    move-wide/from16 v12, p8

    sub-double v14, v7, v12

    .line 222
    iget-boolean v0, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->linear:Z

    if-nez v0, :cond_7

    invoke-static {v3, v4}, Ljava/lang/Math;->abs(D)D

    move-result-wide v16

    const-wide v18, 0x3f50624dd2f1a9fcL    # 0.001

    cmpg-double v0, v16, v18

    if-ltz v0, :cond_7

    invoke-static {v14, v15}, Ljava/lang/Math;->abs(D)D

    move-result-wide v16

    cmpg-double v0, v16, v18

    if-gez v0, :cond_2

    goto :goto_4

    :cond_2
    const/16 v0, 0x65

    new-array v0, v0, [D

    .line 234
    iput-object v0, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mLut:[D

    .line 235
    iget-boolean v0, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mVertical:Z

    if-eqz v0, :cond_3

    const/4 v0, -0x1

    goto :goto_0

    :cond_3
    const/4 v0, 0x1

    :goto_0
    int-to-double v10, v0

    invoke-static {v10, v11}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v3, v3, v10

    iput-wide v3, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mEllipseA:D

    .line 236
    iget-boolean v0, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mVertical:Z

    if-eqz v0, :cond_4

    const/4 v0, 0x1

    goto :goto_1

    :cond_4
    const/4 v0, -0x1

    :goto_1
    int-to-double v3, v0

    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v14, v14, v3

    iput-wide v14, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mEllipseB:D

    .line 237
    iget-boolean v0, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mVertical:Z

    if-eqz v0, :cond_5

    move-wide v3, v5

    goto :goto_2

    :cond_5
    move-wide v3, v1

    :goto_2
    iput-wide v3, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mEllipseCenterX:D

    .line 238
    iget-boolean v0, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mVertical:Z

    if-eqz v0, :cond_6

    move-wide v3, v12

    goto :goto_3

    :cond_6
    move-wide v3, v7

    :goto_3
    iput-wide v3, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mEllipseCenterY:D

    move-object/from16 v0, p0

    move-wide/from16 v1, p6

    move-wide/from16 v3, p8

    move-wide/from16 v5, p10

    move-wide/from16 v7, p12

    .line 239
    invoke-direct/range {v0 .. v8}, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->buildTable(DDDD)V

    .line 240
    iget-wide v0, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mArcDistance:D

    iget-wide v2, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mOneOverDeltaTime:D

    mul-double v0, v0, v2

    iput-wide v0, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mArcVelocity:D

    return-void

    :cond_7
    :goto_4
    const/4 v0, 0x1

    .line 223
    iput-boolean v0, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->linear:Z

    .line 224
    iput-wide v1, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mX1:D

    .line 225
    iput-wide v5, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mX2:D

    .line 226
    iput-wide v12, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mY1:D

    .line 227
    iput-wide v7, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mY2:D

    .line 228
    invoke-static {v14, v15, v3, v4}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v0

    iput-wide v0, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mArcDistance:D

    .line 229
    iget-wide v0, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mArcDistance:D

    iget-wide v5, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mOneOverDeltaTime:D

    mul-double v0, v0, v5

    iput-wide v0, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mArcVelocity:D

    .line 230
    iget-wide v0, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime2:D

    iget-wide v5, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime1:D

    sub-double v7, v0, v5

    div-double/2addr v3, v7

    iput-wide v3, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mEllipseCenterX:D

    sub-double/2addr v0, v5

    div-double/2addr v14, v0

    .line 231
    iput-wide v14, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mEllipseCenterY:D

    return-void
.end method

.method private buildTable(DDDD)V
    .locals 20

    move-object/from16 v0, p0

    sub-double v1, p5, p1

    sub-double v3, p3, p7

    const/4 v8, 0x0

    const-wide/16 v9, 0x0

    const-wide/16 v11, 0x0

    const-wide/16 v13, 0x0

    .line 311
    :goto_0
    sget-object v15, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->ourPercent:[D

    array-length v5, v15

    if-ge v8, v5, :cond_1

    const-wide v16, 0x4056800000000000L    # 90.0

    int-to-double v6, v8

    .line 312
    invoke-static {v6, v7}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v6, v6, v16

    array-length v5, v15

    add-int/lit8 v5, v5, -0x1

    move-wide/from16 p4, v9

    int-to-double v9, v5

    invoke-static {v9, v10}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v6, v9

    invoke-static {v6, v7}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v5

    .line 313
    invoke-static {v5, v6}, Ljava/lang/Math;->sin(D)D

    move-result-wide v9

    .line 314
    invoke-static {v5, v6}, Ljava/lang/Math;->cos(D)D

    move-result-wide v5

    mul-double v9, v9, v1

    mul-double v5, v5, v3

    if-lez v8, :cond_0

    sub-double v11, v9, v11

    sub-double v13, v5, v13

    .line 318
    invoke-static {v11, v12, v13, v14}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v11

    add-double v11, p4, v11

    .line 319
    sget-object v7, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->ourPercent:[D

    aput-wide v11, v7, v8

    goto :goto_1

    :cond_0
    move-wide/from16 v11, p4

    :goto_1
    add-int/lit8 v8, v8, 0x1

    move-wide v13, v5

    move-wide/from16 v18, v9

    move-wide v9, v11

    move-wide/from16 v11, v18

    goto :goto_0

    :cond_1
    move-wide v11, v9

    .line 325
    iput-wide v11, v0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mArcDistance:D

    const/4 v1, 0x0

    .line 327
    :goto_2
    sget-object v2, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->ourPercent:[D

    array-length v3, v2

    if-ge v1, v3, :cond_2

    .line 328
    aget-wide v3, v2, v1

    div-double/2addr v3, v11

    aput-wide v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_2
    const/4 v1, 0x0

    .line 330
    :goto_3
    iget-object v2, v0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mLut:[D

    array-length v3, v2

    if-ge v1, v3, :cond_5

    int-to-double v3, v1

    .line 331
    array-length v2, v2

    add-int/lit8 v2, v2, -0x1

    int-to-double v5, v2

    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    invoke-static {v5, v6}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v3, v5

    .line 332
    sget-object v2, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->ourPercent:[D

    invoke-static {v2, v3, v4}, Ljava/util/Arrays;->binarySearch([DD)I

    move-result v2

    if-ltz v2, :cond_3

    .line 334
    iget-object v3, v0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mLut:[D

    sget-object v4, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->ourPercent:[D

    array-length v4, v4

    add-int/lit8 v4, v4, -0x1

    div-int/2addr v2, v4

    int-to-double v4, v2

    aput-wide v4, v3, v1

    const-wide/16 v5, 0x0

    goto :goto_4

    :cond_3
    const/4 v5, -0x1

    if-ne v2, v5, :cond_4

    .line 336
    iget-object v2, v0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mLut:[D

    const-wide/16 v5, 0x0

    aput-wide v5, v2, v1

    goto :goto_4

    :cond_4
    const-wide/16 v5, 0x0

    neg-int v2, v2

    add-int/lit8 v7, v2, -0x2

    add-int/lit8 v2, v2, -0x1

    int-to-double v8, v7

    .line 341
    sget-object v10, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->ourPercent:[D

    aget-wide v11, v10, v7

    sub-double/2addr v3, v11

    aget-wide v11, v10, v2

    aget-wide v13, v10, v7

    sub-double/2addr v11, v13

    div-double/2addr v3, v11

    invoke-static {v8, v9}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v8, v3

    array-length v2, v10

    add-int/lit8 v2, v2, -0x1

    int-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v8, v2

    .line 343
    iget-object v2, v0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mLut:[D

    aput-wide v8, v2, v1

    :goto_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_5
    return-void
.end method


# virtual methods
.method getDX()D
    .locals 6

    .line 260
    iget-wide v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mEllipseA:D

    iget-wide v2, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTmpCosAngle:D

    mul-double v0, v0, v2

    .line 261
    iget-wide v2, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mEllipseB:D

    neg-double v2, v2

    iget-wide v4, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTmpSinAngle:D

    mul-double v2, v2, v4

    .line 262
    iget-wide v4, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mArcVelocity:D

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v2

    div-double/2addr v4, v2

    .line 263
    iget-boolean v2, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mVertical:Z

    if-eqz v2, :cond_0

    neg-double v0, v0

    :cond_0
    mul-double v0, v0, v4

    return-wide v0
.end method

.method getDY()D
    .locals 6

    .line 267
    iget-wide v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mEllipseA:D

    iget-wide v2, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTmpCosAngle:D

    mul-double v0, v0, v2

    .line 268
    iget-wide v2, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mEllipseB:D

    neg-double v2, v2

    iget-wide v4, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTmpSinAngle:D

    mul-double v2, v2, v4

    .line 269
    iget-wide v4, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mArcVelocity:D

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v0

    div-double/2addr v4, v0

    .line 270
    iget-boolean v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mVertical:Z

    if-eqz v0, :cond_0

    neg-double v0, v2

    mul-double v0, v0, v4

    goto :goto_0

    :cond_0
    mul-double v0, v2, v4

    :goto_0
    return-wide v0
.end method

.method public getLinearDX(D)D
    .locals 0

    .line 284
    iget-wide p1, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mEllipseCenterX:D

    return-wide p1
.end method

.method public getLinearDY(D)D
    .locals 0

    .line 288
    iget-wide p1, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mEllipseCenterY:D

    return-wide p1
.end method

.method public getLinearX(D)D
    .locals 4

    .line 274
    iget-wide v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime1:D

    sub-double/2addr p1, v0

    iget-wide v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mOneOverDeltaTime:D

    mul-double p1, p1, v0

    .line 275
    iget-wide v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mX1:D

    iget-wide v2, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mX2:D

    sub-double/2addr v2, v0

    mul-double p1, p1, v2

    add-double/2addr v0, p1

    return-wide v0
.end method

.method public getLinearY(D)D
    .locals 4

    .line 279
    iget-wide v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime1:D

    sub-double/2addr p1, v0

    iget-wide v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mOneOverDeltaTime:D

    mul-double p1, p1, v0

    .line 280
    iget-wide v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mY1:D

    iget-wide v2, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mY2:D

    sub-double/2addr v2, v0

    mul-double p1, p1, v2

    add-double/2addr v0, p1

    return-wide v0
.end method

.method getX()D
    .locals 6

    .line 252
    iget-wide v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mEllipseCenterX:D

    iget-wide v2, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mEllipseA:D

    iget-wide v4, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTmpSinAngle:D

    mul-double v2, v2, v4

    add-double/2addr v0, v2

    return-wide v0
.end method

.method getY()D
    .locals 6

    .line 256
    iget-wide v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mEllipseCenterY:D

    iget-wide v2, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mEllipseB:D

    iget-wide v4, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTmpCosAngle:D

    mul-double v2, v2, v4

    add-double/2addr v0, v2

    return-wide v0
.end method

.method lookup(D)D
    .locals 8

    const-wide/16 v0, 0x0

    cmpg-double v2, p1, v0

    if-gtz v2, :cond_0

    return-wide v0

    :cond_0
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    cmpl-double v2, p1, v0

    if-ltz v2, :cond_1

    return-wide v0

    .line 298
    :cond_1
    iget-object v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mLut:[D

    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    int-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Double;->isNaN(D)Z

    mul-double p1, p1, v1

    double-to-int v1, p1

    int-to-double v2, v1

    .line 301
    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    sub-double/2addr p1, v2

    .line 303
    aget-wide v2, v0, v1

    add-int/lit8 v4, v1, 0x1

    aget-wide v4, v0, v4

    aget-wide v6, v0, v1

    sub-double/2addr v4, v6

    mul-double p1, p1, v4

    add-double/2addr v2, p1

    return-wide v2
.end method

.method setPoint(D)V
    .locals 2

    .line 244
    iget-boolean v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mVertical:Z

    if-eqz v0, :cond_0

    iget-wide v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime2:D

    sub-double/2addr v0, p1

    goto :goto_0

    :cond_0
    iget-wide v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime1:D

    sub-double v0, p1, v0

    :goto_0
    iget-wide p1, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mOneOverDeltaTime:D

    mul-double v0, v0, p1

    const-wide p1, 0x3ff921fb54442d18L    # 1.5707963267948966

    .line 245
    invoke-virtual {p0, v0, v1}, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->lookup(D)D

    move-result-wide v0

    mul-double v0, v0, p1

    .line 247
    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide p1

    iput-wide p1, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTmpSinAngle:D

    .line 248
    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    move-result-wide p1

    iput-wide p1, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTmpCosAngle:D

    return-void
.end method
