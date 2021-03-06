module PyCall
  module Utils
    def dir(pyobj)
      value = LibPython.PyObject_Dir(pyobj)
      return value.to_ruby unless value.null?
      raise PyError.fetch
    end

    def int(pyobj)
      @int ||= PyCall.eval('int')
      @int.(pyobj)
    end

    def len(pyobj)
      @len ||= PyCall.eval('len')
      @len.(pyobj)
    end

    def slice(*args)
      Slice.new(*args)
    end

    def str(pyobj)
      @str ||= PyCall.eval('str')
      @str.(pyobj)
    end

    def tuple(*args)
      PyCall::Tuple[*args]
    end

    def type(pyobj)
      @type ||= PyCall.eval('type')
      @type.(pyobj)
    end

    def format_traceback(pyobj)
      @format_tb ||= import_module('traceback').format_tb
      @format_tb.(pyobj)
    end
  end

  extend Utils
end
