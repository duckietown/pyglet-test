import json
import pyglet

pyglet.options['headless'] = True
from pyglet import gl
from ctypes import c_char_p, cast
options = {
    "vendor": gl.GL_VENDOR,
    "renderer": gl.GL_RENDERER,
    "version": gl.GL_VERSION,
    "shading-language-version": gl.GL_SHADING_LANGUAGE_VERSION,
    # 'extensions': gl.GL_EXTENSIONS
}

results = {}
for o, code in options.items():
    a = gl.glGetString(code)
    b: bytes = cast(a, c_char_p).value
    res = b.decode()
    results[o] = res
print(json.dumps(results, indent=2))
