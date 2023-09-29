CREATE PROCEDURE dbo.st_AdicionaSolicitacao (@Err_Code           Smallint     = 0  OUTPUT
                                            ,@Err_Msg            Varchar(255) = '' OUTPUT
                                            ,@ID_Pessoa          Integer
                                            ,@VL_Pretencao_Sal   Numeric(18,2)
                                            ,@Objetivo           Varchar(200))
AS
BEGIN
  SET NOCOUNT ON;
  BEGIN TRY
    SELECT @Err_Code = 0
          ,@Err_Msg  = '';

    IF (@ID_Pessoa IS NULL)               SET @Err_Msg = 'ID_Pessoa';
    IF (ISNULL(@VL_Pretencao_Sal, 0) = 0) SET @Err_Msg = 'VL_Pretencao_Sal';
    IF (ISNULL(@Objetivo, '') = '')       SET @Err_Msg = 'Objetivo';

    DECLARE @ID_Cargo Integer
           ,@NM_Solitacao Varchar(100)
           ,@NM_Pessoa Varchar(100)
           ,@DT_Base Datetime
           ,@DT_Base_Aux Char(10)
           ,@DT_Vigencia Datetime

    SELECT @DT_Base     = CAST(GETDATE() AS date)
          ,@DT_Base     = FORMAT(@DT_Base, 'dd/MM/yyyy')
          ,@DT_Base_Aux = CAST(FORMAT(@DT_Base, 'dd/MM/yyyy') AS Char(10))

          ,@DT_Vigencia = DATEADD(DD, 15, @DT_Base)
   
    SELECT @ID_Cargo  = ID_Cargo
          ,@NM_Pessoa = NM_Pessoa
    FROM dbo.pessoas WITH (NOLOCK)
    WHERE ID_Pessoa = @ID_Pessoa

    SELECT @NM_Solitacao = @NM_Pessoa + ' - ' + @DT_Base_Aux

    SET @Err_Msg = 'Erro ao inserir registros na tabela solicitacoes.'
    INSERT INTO dbo.solicitacoes (NM_Solicitacao
                                 ,ID_Pessoa
                                 ,ID_Cargo
                                 ,Objetivo
                                 ,VL_Pretencao_Sal
                                 ,DH_Inclusao
                                 ,DT_Vigencia_Vaga)
    SELECT @NM_Solitacao
          ,@ID_Pessoa
          ,@ID_Cargo
          ,@Objetivo
          ,@VL_Pretencao_Sal
          ,GETDATE()
          ,@DT_Vigencia;

    SELECT @Err_Code = 0
          ,@Err_Msg  = '';

  END TRY

  BEGIN CATCH
    SELECT @Err_Code = CASE WHEN @Err_Code = 0 THEN 1 END
          ,@Err_Msg  = @Err_Msg;
  END CATCH
END