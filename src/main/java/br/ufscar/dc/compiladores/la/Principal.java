package br.ufscar.dc.compiladores.la;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;

import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.Token;

public class Principal {
    public static void main(String[] args) throws IOException {
        CharStream cs = CharStreams.fromFileName(args[0]);
        // Analisador Léxico da LA
        LaLexer lexer = new LaLexer(cs);
        // Arquivo de saída
        OutputStream os = new FileOutputStream(args[1]);

        Token token;
        String message;
        byte[] buffer;

        while ((token = lexer.nextToken()).getType() != Token.EOF) {
            String type = LaLexer.VOCABULARY.getDisplayName(token.getType());
            if (type.equals("DESCONHECIDO")) {
                String invalidChar = token.getText();
                if (invalidChar.equals("{")) {
                    // Erro causado por comentário não fechado na mesma linha
                    message = "Linha " + token.getLine() + ": comentário nao fechado\n";
                } else if (invalidChar.equals("\"")) {
                    // Erro causado por cadeia não fechada na mesma linha
                    message = "Linha " + token.getLine() + ": cadeia literal nao fechada\n";
                } else {
                    // Não foi possível gerar um token
                    message = "Linha " + token.getLine() + ": " + token.getText() + " - simbolo nao identificado\n";
                }

                // Imprime a mensagem de erro no arquivo de saída e encerra a execução
                buffer = message.getBytes(StandardCharsets.UTF_8);
                os.write(buffer);
                break;
            }
            if (type.equals("PALAVRA_CHAVE") | type.equals("DELIM") | type.equals("OP_ARITM") | type.equals("OP_REL")) {
                // Usa o valor do token para tipos que são lista de valores
                type = "'" + token.getText() + "'";
            }

            // Imprime o token encontrado no arquivo de saída
            message = "<'" + token.getText() + "'," + type + ">\n";
            buffer = (message).getBytes(StandardCharsets.UTF_8);
            os.write(buffer);
        }
        os.close();

    }
}
