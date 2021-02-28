package br.ufscar.dc.compiladores.la;

import org.antlr.v4.runtime.BaseErrorListener;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.RecognitionException;
import org.antlr.v4.runtime.Recognizer;
import org.antlr.v4.runtime.misc.Interval;
import org.antlr.v4.runtime.misc.ParseCancellationException;

public class TokenInvalidoErrorListener extends BaseErrorListener {
    public static final TokenInvalidoErrorListener INSTANCE = new TokenInvalidoErrorListener();

    @Override
    public void syntaxError(Recognizer<?, ?> recognizer, Object offendingSymbol, int line, int charPositionInLine, String msg, RecognitionException e)
            throws ParseCancellationException {
        CharStream cs = (CharStream) recognizer.getInputStream();
        String firstCharInError = cs.getText(new Interval(0, 0));
        throw new ParseCancellationException("Linha " + line + ": " + firstCharInError + " - simbolo nao identificado");
    }
}