CREATE PROCEDURE dbo.st_AprovacaoSolicitacao (@Err_Code           Smallint     = 0  OUTPUT
                                             ,@Err_Msg            Varchar(255) = '' OUTPUT
                                             ,@ID_Pessoa          Integer
                                             ,@ID_Cargo           Integer
                                             ,@SN_Resultado       Char(1)
                                             ,@RS_Aplicacao       Varchar(500))
AS                                           
BEGIN
  SET NOCOUNT ON;
    BEGIN TRY
    SELECT @Err_Code = 0
          ,@Err_Msg  = '';

    IF (@ID_Pessoa IS NULL)             SET @Err_Msg = 'ID_Pessoa';
    IF (@ID_Cargo  IS NULL)             SET @Err_Msg = 'VL_Pretencao_Sal';
    IF (ISNULL(@SN_Resultado, '') = '') SET @Err_Msg = 'Objetivo';
    IF (ISNULL(@RS_Aplicacao, '') = '') SET @Err_Msg = '@RS_Aplicacao';

    DECLARE @DT_Base Datetime;

    SELECT @DT_Base = CAST(GETDATE() AS date);

    SET @Err_Msg = 'Erro ao inserir registros na tabela solicitacoes.'
    UPDATE dbo.solicitacoes
    SET SN_Aprovado  = @SN_Resultado
       ,RS_Aplicacao = @RS_Aplicacao
       ,DT_Conclusao = @DT_Base
    WHERE ID_Pessoa = @ID_Pessoa;

    SELECT @Err_Code = 0
          ,@Err_Msg  = '';

  END TRY

  BEGIN CATCH
    SELECT @Err_Code = CASE WHEN @Err_Code = 0 THEN 1 END
          ,@Err_Msg  = @Err_Msg;
  END CATCH
END