package br.ufscar.dc.compiladores.la;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;

import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.misc.ParseCancellationException;

public class Principal {
    public static void main(String[] args) throws IOException {
        CharStream cs = CharStreams.fromFileName(args[0]);
        LaLexer lexer = new LaLexer(cs);
        lexer.removeErrorListeners();
        lexer.addErrorListener(TokenInvalidoErrorListener.INSTANCE);
        OutputStream os = new FileOutputStream(args[1]);

        Token token;
        byte[] data;

        try {
            while ((token = lexer.nextToken()).getType() != Token.EOF) {
                String type = LaLexer.VOCABULARY.getDisplayName(token.getType());
                if (type.equals("PALAVRA_CHAVE") | type.equals("DELIM") | type.equals("OP_ARITM") |  type.equals("OP_REL") ) {
                    type = "'" + token.getText() + "'";
                }
                data = ("<'" + token.getText() + "'," + type + ">\n").getBytes();
                os.write(data);
            }
        } catch (ParseCancellationException e) {
            os.write(e.getMessage().getBytes(StandardCharsets.UTF_8));
        } finally {
            os.close();
        }
    }
}
