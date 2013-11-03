unit SkuDetailSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxCntner, dxTL, dxDBCtrl, dxDBGrid, KBitBtn, StdCtrls,
  GMSLabel, DB, DBTables, dxEditor, dxExEdtr, dxEdLib, dxDBELib,
  libProc,libUser,KGroupBox, DBClient, KDataSetProvider, dxDBTLCl, dxGrClms,
  dxPageControl;

type
  TSkuDetailSelect=record
    JOBNO            :string;    //工作号
    Wi_date          :TDatetime;      //工作日期
    SKUID            :string;    //商品代码
    SKUName          :string;    //商品名称
    SKUbrand         :string;    //商品品牌
    SNO              :integer;   //进仓序号
    LotCode          :string;    //批次
    syQuantity       :extended;   //数量
    QualityName      :string;    //品质(仅有名称)
    QuantityUOM      :string;
    PieceUOM         :string;    //件数单位代码
    WeightUOM        :string;    //重量单位代码
    VolumeUOM        :string;    //体积单位代码
    AreaUOM          :string;    //面积单位代码
    Piece            :integer;   //件数
    NetWeight        :extended;  //净重
    GrossWeight      :extended;  //毛重
    Volume           :extended;  //体积
    Area             :extended;  //面积
    QT_Remain        :integer;   //进仓剩余数量（仅对于进仓,并且对于任务和指令）
    syPiece          :extended;   //剩余件数
    syNetWeight      :extended;  //剩余净重
    syGrossWeight    :extended;  //剩余毛重
    syVolume         :extended;  //剩余体积
    syArea           :extended;  //剩余面积
    Quantity_Piece_Prop  :extended;  //数量和件数的比例
    Quantity_Volume_Prop :extended;  //数量和体积的比例
    Quantity_Weight_Prop :extended;  //数量和重量的比例
    Quantity_Area_Prop   :extended;  //数量和面积的比例
    AccountID        :string;    //寄仓单位代码
    AccountName      :string;    //寄仓单位名称
    ShipperAccountID :string;    //货主代码
    ShipperAccountName :string;  //货主名称
    TagEachUOM       :string;    //标签单位（如托）
    TagTotal         :extended;  //标签总数
    TagNO            :string;    //标签号
    LocationID       :string;    //仓位代码
    LOcationName     :string;    //仓位名称
    LDSNO           :integer;   //具体仓位序号
    DetailSNO    :integer;   //具体仓位序号
    SerialNO         :string;
    SizeUOM          :string;
    Height           :extended;
    Width            :extended;
    Depth            :extended;
    LocationBillNO      :string; // 进仓作业联系单号
    CustomsNO           :string; // 海关报关单号
    Quantity_RemainTask :integer;// 进仓任务剩余数量(仅对于进仓)
    OkFlag              :boolean;
  end;
  TMultSkuDetailSelect=array[0..100] of TSkuDetailSelect;

type
  TfrmSkuDetailSelect = class(TForm)
    grdSkuDetailSelect: TdxDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    btnOk: TKBitBtn;
    btnCancel: TKBitBtn;
    btnSelectAll: TKBitBtn;
    btnCancleAll: TKBitBtn;
    dtsWareInventoryDetail: TDataSource;
    qrySkuDetailSelect: TKADOQuery;
    SKUID: TdxDBGridColumn;
    GMSStickyLabel1: TGMSStickyLabel;
    btnRefresh: TKBitBtn;
    edtSkuName: TdxEdit;
    GMSStickyLabel7: TGMSStickyLabel;
    SerialNO: TdxDBGridColumn;
    QT_Remain: TdxDBGridCurrencyColumn;
    SYPiece: TdxDBGridCurrencyColumn;
    SYNetWeight: TdxDBGridCurrencyColumn;
    SYGrossWeight: TdxDBGridCurrencyColumn;
    SYVolume: TdxDBGridCurrencyColumn;
    SYArea: TdxDBGridCurrencyColumn;
    lotcode: TdxDBGridColumn;
    edtlotcode: TdxEdit;
    GMSStickyLabel2: TGMSStickyLabel;
    sealno: TdxDBGridColumn;
    pgcBlnoAndConno: TdxPageControl;
    blnolb: TdxTabSheet;
    memLocationBillno: TdxMemo;
    dxTabSheet1: TdxTabSheet;
    memMainOrder: TdxMemo;
    dxTabSheet2: TdxTabSheet;
    memCusBillno: TdxMemo;
    tbsBillNO: TdxTabSheet;
    memCustomsno: TdxMemo;
    dxTabSheet3: TdxTabSheet;
    memsealno: TdxMemo;
    customsno: TdxDBGridColumn;
    locationbillno: TdxDBGridColumn;
    procedure btnRefreshClick(Sender: TObject);
    procedure btnSelectAllClick(Sender: TObject);
    procedure btnCancleAllClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    theresult:TMultSkuDetailSelect;
    DataState:TDataState;
    procedure GetSql;
  public
    { Public declarations }
  end;

function WorkSkuDetailSelect(pJobno:string;psno:integer;pStrTableName:string;pintOpType:integer):TMultSkuDetailSelect;

var
  frmSkuDetailSelect: TfrmSkuDetailSelect;

implementation

{$R *.dfm}

Uses Main,  kindlg,  datas ,
     libuserPub;

var
  strZsql:string; //要查询的字段  strLocate,
  strJobno:string;                 //判断是出仓任务商品，还是出仓实际仓位
  intSno:integer;
  strTableName:string;                 
  intOpType:Integer;

function WorkSkuDetailSelect(pJobno:string;psno:integer;pStrTableName:string;pintOpType:integer):TMultSkuDetailSelect;
begin
  frmSkuDetailSelect:=TfrmSkuDetailSelect.create(Application);
  with frmSkuDetailSelect do
  begin
    strJobno        :=pJobno;
    intSno          :=pSno;
    strTableName    :=pstrTableName;
    intOpType       :=pintOpType;
    showmodal;
    SetFormPosition(frmSkuDetailSelect,False);
    WorkSkuDetailSelect:=theresult;
  end;
  frmSkuDetailSelect.Free;
end;

procedure TfrmSkuDetailSelect.btnRefreshClick(Sender: TObject);
begin
   GetSql;
   qrySkuDetailSelect.DisableControls;
   qrySkuDetailSelect.Close;
   try
     qrySkuDetailSelect.Open;
   except
     kMessageDlg(Exception(ExceptObject).Message, mtWarning, [mbOK], 0);
   end;
   qrySkuDetailSelect.EnableControls;
end;

procedure TfrmSkuDetailSelect.btnSelectAllClick(Sender: TObject);
begin
  grdSkuDetailSelect.SelectAll;
end;

procedure TfrmSkuDetailSelect.btnCancleAllClick(Sender: TObject);
begin
  grdSkuDetailSelect.ClearSelection;
end;

procedure TfrmSkuDetailSelect.btnOkClick(Sender: TObject);
var i:integer;
begin
  if not qrySkuDetailSelect.Active then
     begin
       Kmessagedlg(GetMessage('frmSkuDetailSelect','001'), mtInformation,[mbOk],0);//'请按刷新按钮！'
       exit;
     end
  else
    begin
      if grdSkuDetailSelect.SelectedCount=0 then
      begin
        Kmessagedlg(GetMessage('frmSkuDetailSelect','002'), mtInformation,[mbOk],0); //'请选定具体商品！'
        grdSkuDetailSelect.setFocus;
        exit;
      end;
      for i:=0 to (grdSkuDetailSelect.SelectedCount-1) do
      begin
          qrySkuDetailSelect.GotoBookmark(pointer(grdSkuDetailSelect.SelectedRows[i]));
          theresult[i].JOBNO            :=qrySkuDetailSelect.Fieldbyname('JOBNO').asstring;
          theresult[i].SNO              :=qrySkuDetailSelect.fieldbyname('SNO').asInteger;
          theresult[i].LDSNO            :=qrySkuDetailSelect.fieldbyname('LDSNO').asInteger;
          theresult[i].DetailSNO      :=qrySkuDetailSelect.fieldbyname('DetailSNO').asInteger;
          theresult[i].SKUID            :=qrySkuDetailSelect.fieldbyname('SKUID').asstring;
          theresult[i].SKUName          :=qrySkuDetailSelect.fieldbyname('SKUName').asstring;
          theresult[i].QuantityUOM      :=qrySkuDetailSelect.fieldbyname('QuantityUOM').asstring;
          theresult[i].PieceUOM         :=qrySkuDetailSelect.fieldbyname('PieceUOM').asstring;
          theresult[i].WeightUOM        :=qrySkuDetailSelect.fieldbyname('WeightUOM').asstring;
          theresult[i].VolumeUOM        :=qrySkuDetailSelect.fieldbyname('VolumeUOM').asstring;
          theresult[i].AreaUOM          :=qrySkuDetailSelect.Fieldbyname('AreaUOM').asstring;
          theresult[i].LotCode          :=qrySkuDetailSelect.Fieldbyname('LotCode').asstring;
          theresult[i].SerialNO         :=qrySkuDetailSelect.Fieldbyname('SerialNO').asstring;
          theresult[i].syQuantity       :=qrySkuDetailSelect.fieldbyname('syQuantity').asFloat;
          theresult[i].syPiece          :=qrySkuDetailSelect.fieldbyname('syPiece').asFloat;
          theresult[i].syNetWeight      :=qrySkuDetailSelect.fieldbyname('syNetWeight').asFloat;
          theresult[i].syGrossWeight    :=qrySkuDetailSelect.Fieldbyname('syGrossWeight').asFloat;
          theresult[i].syVolume         :=qrySkuDetailSelect.fieldbyname('syVolume').asFloat;
          theresult[i].syArea           :=qrySkuDetailSelect.Fieldbyname('syArea').asFloat;
          theresult[i].SizeUOM          :=qrySkuDetailSelect.fieldbyname('SizeUOM').asstring;
          theresult[i].Height           :=qrySkuDetailSelect.fieldbyname('Height').asFloat;
          theresult[i].Width            :=qrySkuDetailSelect.Fieldbyname('Width').asFloat;
          theresult[i].Depth            :=qrySkuDetailSelect.fieldbyname('Depth').asFloat;                                                                          
          theresult[i].OkFlag        :=True;
      end;
    end;
  frmSkuDetailSelect.Close;
end;

procedure TfrmSkuDetailSelect.btnCancelClick(Sender: TObject);
begin
  frmSkuDetailSelect.Close;
  theresult[0].OkFlag:=False;
end;

procedure TfrmSkuDetailSelect.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (DataState in setdcs) and not _AllowClose then Action := caNone else
  begin
    Action := caFree;
    lampchange(lsmenu);
  end;
end;

procedure TfrmSkuDetailSelect.FormCreate(Sender: TObject);
begin
  SetFormPosition(Self,True);
  SetFormStyle(Self);
  SetDxDbGrid(grdskuDetailselect);
  qrySkuDetailSelect.Connection:=_ADOConnection;
end;

procedure TfrmSkuDetailSelect.FormDestroy(Sender: TObject);
begin
  Lampchange(lsMenu);
  frmSkuDetailSelect:=nil;
end;

procedure TfrmSkuDetailSelect.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Vk_Return:
      if ACtiveControl = grdSkuDetailSelect then frmSkuDetailSelect.btnOkClick(Self)
                else Sendmessage(Self.Handle,WM_NEXTDLGCTL,0,0);
    vk_Down:
      if ACtiveControl <> grdSkuDetailSelect then  qrySkuDetailSelect.Next;
    VK_Up:
      if ACtiveControl <> grdSkuDetailSelect then qrySkuDetailSelect.Prior;
    Vk_Escape:KeyDownControl(Key,btnCancel);
  end;
end;

procedure TfrmSkuDetailSelect.GetSql;
var
   strtablenameorder:string;
   strlotcode,strfilter,strfilerTmp:string;
   i:Integer;
begin
   if (intOpType=-1) then
   begin
      if edtlotcode.Text<>'' then
      begin
         strlotcode:=replace(edtlotcode.Text,',','","',False);
         strfilter:=strfilter+' and detail.lotcode in ("'+strlotcode+'")';
      end;
      //lzw20100908仓单号
      if Trim(memLocationBillno.Text)<>'' then
      begin
         strfilerTmp:='';
         for I:=0 to memLocationBillno.Lines.Count-1 do
         begin
            if Trim(memLocationBillno.Lines.Strings[I])<>'' then
               strfilerTmp:=strfilerTmp+' or isnull(item.locationbillno,"") like "%'+Trim(memLocationBillno.Lines.Strings[I])+'%" ';
         end;
         if strfilerTmp<>'' then
         begin
            delete(strfilerTmp,1,3);
            strfilter:=strfilter+' and ('+strfilerTmp+' ) ';
         end;
      end;
      //主订单号
      if Trim(memMainOrder.Text)<>'' then
      begin
         strfilerTmp:='';
         for I:=0 to memMainOrder.Lines.Count-1 do
         begin
            if Trim(memMainOrder.Lines.Strings[I])<>'' then
               strfilerTmp:=strfilerTmp+' or isnull(item.mainorder,"") like "%'+Trim(memMainOrder.Lines.Strings[I])+'%" ';
         end;
         if strfilerTmp<>'' then
         begin
            delete(strfilerTmp,1,3);
            strfilter:=strfilter+' and ('+strfilerTmp+' ) ';
         end;
      end;
      //客户单号
      if Trim(memCusBillno.Text)<>'' then
      begin
         strfilerTmp:='';
         for I:=0 to memCusBillno.Lines.Count-1 do
         begin
            if Trim(memCusBillno.Lines.Strings[I])<>'' then
               strfilerTmp:=strfilerTmp+' or isnull(item.cusbillno,"") like "%'+Trim(memCusBillno.Lines.Strings[I])+'%" ';
         end;
         if strfilerTmp<>'' then
         begin
            delete(strfilerTmp,1,3);
            strfilter:=strfilter+' and ('+strfilerTmp+' ) ';
         end;
      end;
      //报关单号
      if Trim(memCustomsno.Text)<>'' then
      begin
         strfilerTmp:='';
         for I:=0 to memCustomsno.Lines.Count-1 do
         begin
            if Trim(memCustomsno.Lines.Strings[I])<>'' then
               strfilerTmp:=strfilerTmp+' or isnull(item.customsno,"") like "%'+Trim(memCustomsno.Lines.Strings[I])+'%" ';
         end;
         if strfilerTmp<>'' then
         begin
            delete(strfilerTmp,1,3);
            strfilter:=strfilter+' and ('+strfilerTmp+' ) ';
         end;
      end;
      //箱号
      if Trim(memsealno.Text)<>'' then
      begin
         strfilerTmp:='';
         for I:=0 to memsealno.Lines.Count-1 do
         begin
            if Trim(memsealno.Lines.Strings[I])<>'' then
               strfilerTmp:=strfilerTmp+' or isnull(detail.sealno,"") like "%'+Trim(memsealno.Lines.Strings[I])+'%" ';
         end;
         if strfilerTmp<>'' then
         begin
            delete(strfilerTmp,1,3);
            strfilter:=strfilter+' and ('+strfilerTmp+' ) ';
         end;
      end;

      strzSql:='declare @SKUName char(100)'+chr(13)+chr(10)
              +' select @SKUName="'+edtSKUName.Text+'"'+chr(13)+chr(10)
              +' select detail.jobno,detail.skuid,detail.skuname,detail.sno,detail.ldsno,detail.detailsno,'+chr(13)+chr(10)
              +'        detail.quantityuom,detail.pieceuom,detail.lotcode,detail.serialno, '+chr(13)+chr(10)
              +'        detail.weightuom,detail.volumeuom,detail.areauom,'+chr(13)+chr(10)
              +'        detail.quantity, detail.Piece,detail.netweight,detail.grossweight,detail.volume,detail.area, '+chr(13)+chr(10)
              //lzw20100908
              +'        item.cusbillno,item.locationbillno,item.customsno,detail.sealno,  '+chr(13)+chr(10)
              //              +'        detail.jobnoin,detail.snoin,'+chr(13)+chr(10)
              +'        detail.sizeuom,detail.height,detail.width,detail.depth, '+chr(13)+chr(10)
              +'        keyid=Detail.detailsno,'+chr(13)+chr(10)
              +'        syQuantity   =detail.quantity-sum(isnull(cc.quantity,0)), '+chr(13)+chr(10)
              +'        syPiece      =detail.piece-sum(isnull(cc.piece,0)), '+chr(13)+chr(10)
              +'        syNetWeight  =detail.netweight-sum(isnull(cc.netweight,0)), '+chr(13)+chr(10)
              +'        syGrossWeight=detail.grossweight-sum(isnull(cc.grossweight,0)), '+chr(13)+chr(10)
              +'        syVolume     =detail.volume-sum(isnull(cc.volume,0)), '+chr(13)+chr(10)
              +'        syArea       =detail.area-sum(isnull(cc.area,0)) '+chr(13)+chr(10)
              +'   from Locinskudetail detail (nolock) left join '+strTableName+' cc (nolock) '+chr(13)+chr(10)
              +'                                            on cc.jobnoin=detail.jobno '+chr(13)+chr(10)
              +'                                           and cc.snoin=detail.sno '+chr(13)+chr(10)
              +'                                           and cc.LDsnoin=detail.LDsno '+chr(13)+chr(10)
              +'                                           and cc.detailsnoin=detail.detailsno '+chr(13)+chr(10)
//              +'                                           and CC.operationtype=-1 '+chr(13)+chr(10)
              //lzw20100908
              +'        left join locationinitem item(nolock)    '+chr(13)+chr(10)
              +'               on item.jobno=detail.jobno        '+chr(13)+chr(10)
              +'              and item.jobno=detail.jobno        '+chr(13)+chr(10)
              
              +'  where detail.Jobno="'+strJobno+'"'+chr(13)+chr(10)
              +'    and detail.Sno='+inttostr(intSno)+''+chr(13)+chr(10)
//              +'    and detail.operationtype=1 '+chr(13)+chr(10)
              +'    and isnull(detail.skuname,"") like "%"+rtrim(@SKUName)+"%" '+chr(13)+chr(10)
              +strfilter
              +'group by detail.Jobno,detail.skuid,detail.skuname,detail.sno,detail.detailsno, '+chr(13)+chr(10)
              +'       detail.quantityuom,detail.pieceuom,detail.lotcode,detail.serialno, '+chr(13)+chr(10)
              +'       detail.weightuom,detail.volumeuom,detail.areauom,'+chr(13)+chr(10)
              +'       item.cusbillno,item.locationbillno,item.customsno,detail.sealno,  '+chr(13)+chr(10)
              +'       detail.quantity, detail.piece,detail.netweight,detail.grossweight,Detail.volume,detail.area, '+chr(13)+chr(10)
//              +'       detail.jobnoin,detail.snoin,'+chr(13)+chr(10)
              +'       detail.sizeuom,detail.height,detail.width,detail.depth,detail.ldsno '+chr(13)+chr(10)
              +'  having detail.quantity-sum(isnull(cc.quantity,0))>0 ';
      {strzSql:='declare @SKUName char(100)'+chr(13)+chr(10)
              +' select @SKUName="'+edtSKUName.Text+'"'+chr(13)+chr(10)
              +' select detail.jobno,detail.skuid,detail.skuname,detail.sno,detail.ldsno,detail.detailsno,'+chr(13)+chr(10)
              +'        detail.quantityuom,detail.pieceuom,detail.lotcode,detail.serialno, '+chr(13)+chr(10)
              +'        detail.weightuom,detail.volumeuom,detail.areauom,'+chr(13)+chr(10)
              +'        detail.quantity, detail.Piece,detail.netweight,detail.grossweight,detail.volume,detail.area, '+chr(13)+chr(10)
//              +'        detail.jobnoin,detail.snoin,'+chr(13)+chr(10)
              +'        detail.sizeuom,detail.height,detail.width,detail.depth, '+chr(13)+chr(10)
              +'        keyid=Detail.detailsno,'+chr(13)+chr(10)
              +'        syQuantity   =detail.quantityremain, '+chr(13)+chr(10)
              +'        syPiece      =detail.piece*detail.quantityremain/detail.quantity, '+chr(13)+chr(10)
              +'        syNetWeight  =detail.netweight*detail.quantityremain/detail.quantity, '+chr(13)+chr(10)
              +'        syGrossWeight=detail.grossweight*detail.quantityremain/detail.quantity, '+chr(13)+chr(10)
              +'        syVolume     =detail.volume*detail.quantityremain/detail.quantity, '+chr(13)+chr(10)
              +'        syArea       =detail.area*detail.quantityremain/detail.quantity '+chr(13)+chr(10)
              +'   from Locinskudetail detail (nolock) '+chr(13)+chr(10)
              +'  where detail.Jobno="'+strJobno+'"'+chr(13)+chr(10)
              +'    and detail.Sno='+inttostr(intSno)+''+chr(13)+chr(10)
              +'    and isnull(detail.skuname,"") like "%"+rtrim(@SKUName)+"%" '+chr(13)+chr(10)
              +'group by detail.Jobno,detail.skuid,detail.skuname,detail.sno,detail.detailsno, '+chr(13)+chr(10)
              +'       detail.quantityuom,detail.pieceuom,detail.lotcode,detail.serialno, '+chr(13)+chr(10)
              +'       detail.weightuom,detail.volumeuom,detail.areauom,'+chr(13)+chr(10)
              +'       detail.quantity, detail.piece,detail.netweight,detail.grossweight,Detail.volume,detail.area, '+chr(13)+chr(10)
//              +'       detail.jobnoin,detail.snoin,'+chr(13)+chr(10)
              +'       detail.sizeuom,detail.height,detail.width,detail.depth,detail.ldsno,detail.quantityremain '+chr(13)+chr(10)
              +'  having detail.quantityremain<>0 '; }
      qrySkuDetailSelect.Sql.Clear;
      qrySkuDetailSelect.Sql.Add(strZsql+'order by 1,2');
   end else
   begin
      if (UpperCase(strTableName)='LIOSKUDETAIL') then
          strtablenameorder:='wareorderskudetail'
      else
          strtablenameorder:='transorderskudetail';
      strzSql:='declare @SKUName char(100)'+chr(13)+chr(10)
              +' select @SKUName="'+edtSKUName.Text+'"'+chr(13)+chr(10)
              +' select detail.jobno,detail.skuid,detail.skuname,detail.sno,detail.ldsno,detail.detailsno,'+chr(13)+chr(10)
              +'        detail.quantityuom,detail.pieceuom,detail.lotcode,detail.serialno, '+chr(13)+chr(10)
              +'        detail.weightuom,detail.volumeuom,detail.areauom,'+chr(13)+chr(10)
              +'        detail.quantity, detail.Piece,detail.netweight,detail.grossweight,detail.volume,detail.area, '+chr(13)+chr(10)
              +'        detail.jobnoin,detail.snoin,'+chr(13)+chr(10)
              +'        detail.sizeuom,detail.height,detail.width,detail.depth, '+chr(13)+chr(10)
              +'        keyid=detail.ldsno,'+chr(13)+chr(10)
              +'        syQuantity=detail.Quantity, '+chr(13)+chr(10)
              +'        syPiece=detail.Piece, '+chr(13)+chr(10)
              +'        syNetWeight=detail.NetWeight, '+chr(13)+chr(10)
              +'        syGrossWeight=detail.GrossWeight, '+chr(13)+chr(10)
              +'        syVolume=detail.Volume, '+chr(13)+chr(10)
              +'        syArea=detail.Area '+chr(13)+chr(10)
              +'   from '+strtablenameorder+' detail (nolock) '+chr(13)+chr(10)
              +'  where detail.Jobno="'+strJobno+'"'+chr(13)+chr(10)
              +'    and detail.Sno='+inttostr(intSno)+''+chr(13)+chr(10)
              +'    and isnull(detail.SKUName,"") like "%"+rtrim(@SKUName)+"%" ';
      qrySkuDetailSelect.Sql.Clear;
      qrySkuDetailSelect.Sql.Add(strZsql+'order by 1,2');
   end;      
end;

end.
