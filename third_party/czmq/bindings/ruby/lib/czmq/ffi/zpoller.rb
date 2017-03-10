################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################

module CZMQ
  module FFI

    # event-driven reactor
    # @note This class is 100% generated using zproject.
    class Zpoller
      # Raised when one tries to use an instance of {Zpoller} after
      # the internal pointer to the native object has been nullified.
      class DestroyedError < RuntimeError; end

      # Boilerplate for self pointer, initializer, and finalizer
      class << self
        alias :__new :new
      end
      # Attaches the pointer _ptr_ to this instance and defines a finalizer for
      # it if necessary.
      # @param ptr [::FFI::Pointer]
      # @param finalize [Boolean]
      def initialize(ptr, finalize = true)
        @ptr = ptr
        if @ptr.null?
          @ptr = nil # Remove null pointers so we don't have to test for them.
        elsif finalize
          @finalizer = self.class.create_finalizer_for @ptr
          ObjectSpace.define_finalizer self, @finalizer
        end
      end
      # @param ptr [::FFI::Pointer]
      # @return [Proc]
      def self.create_finalizer_for(ptr)
        Proc.new do
          ptr_ptr = ::FFI::MemoryPointer.new :pointer
          ptr_ptr.write_pointer ptr
          ::CZMQ::FFI.zpoller_destroy ptr_ptr
        end
      end
      # @return [Boolean]
      def null?
        !@ptr or @ptr.null?
      end
      # Return internal pointer
      # @return [::FFI::Pointer]
      def __ptr
        raise DestroyedError unless @ptr
        @ptr
      end
      # So external Libraries can just pass the Object to a FFI function which expects a :pointer
      alias_method :to_ptr, :__ptr
      # Nullify internal pointer and return pointer pointer.
      # @note This detaches the current instance from the native object
      #   and thus makes it unusable.
      # @return [::FFI::MemoryPointer] the pointer pointing to a pointer
      #   pointing to the native object
      def __ptr_give_ref
        raise DestroyedError unless @ptr
        ptr_ptr = ::FFI::MemoryPointer.new :pointer
        ptr_ptr.write_pointer @ptr
        __undef_finalizer if @finalizer
        @ptr = nil
        ptr_ptr
      end
      # Undefines the finalizer for this object.
      # @note Only use this if you need to and can guarantee that the native
      #   object will be freed by other means.
      # @return [void]
      def __undef_finalizer
        ObjectSpace.undefine_finalizer self
        @finalizer = nil
      end

      # Create new poller, specifying zero or more readers. The list of 
      # readers ends in a NULL. Each reader can be a zsock_t instance, a
      # zactor_t instance, a libzmq socket (void *), or a file handle.  
      # @param reader [::FFI::Pointer, #to_ptr]
      # @param args [Array<Object>]
      # @return [CZMQ::Zpoller]
      def self.new(reader, *args)
        ptr = ::CZMQ::FFI.zpoller_new(reader, *args)
        __new ptr
      end

      # Destroy a poller
      #
      # @return [void]
      def destroy()
        return unless @ptr
        self_p = __ptr_give_ref
        result = ::CZMQ::FFI.zpoller_destroy(self_p)
        result
      end

      # Add a reader to be polled. Returns 0 if OK, -1 on failure. The reader may
      # be a libzmq void * socket, a zsock_t instance, or a zactor_t instance.   
      #
      # @param reader [::FFI::Pointer, #to_ptr]
      # @return [Integer]
      def add(reader)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zpoller_add(self_p, reader)
        result
      end

      # Remove a reader from the poller; returns 0 if OK, -1 on failure. The reader
      # must have been passed during construction, or in an zpoller_add () call.   
      #
      # @param reader [::FFI::Pointer, #to_ptr]
      # @return [Integer]
      def remove(reader)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zpoller_remove(self_p, reader)
        result
      end

      # By default the poller stops if the process receives a SIGINT or SIGTERM  
      # signal. This makes it impossible to shut-down message based architectures
      # like zactors. This method lets you switch off break handling. The default
      # nonstop setting is off (false).                                          
      #
      # @param nonstop [Boolean]
      # @return [void]
      def set_nonstop(nonstop)
        raise DestroyedError unless @ptr
        self_p = @ptr
        nonstop = !(0==nonstop||!nonstop) # boolean
        result = ::CZMQ::FFI.zpoller_set_nonstop(self_p, nonstop)
        result
      end

      # Poll the registered readers for I/O, return first reader that has input.  
      # The reader will be a libzmq void * socket, or a zsock_t or zactor_t       
      # instance as specified in zpoller_new/zpoller_add. The timeout should be   
      # zero or greater, or -1 to wait indefinitely. Socket priority is defined   
      # by their order in the poll list. If you need a balanced poll, use the low 
      # level zmq_poll method directly. If the poll call was interrupted (SIGINT),
      # or the ZMQ context was destroyed, or the timeout expired, returns NULL.   
      # You can test the actual exit condition by calling zpoller_expired () and  
      # zpoller_terminated (). The timeout is in msec.                            
      #
      # @param timeout [Integer, #to_int, #to_i]
      # @return [::FFI::Pointer]
      def wait(timeout)
        raise DestroyedError unless @ptr
        self_p = @ptr
        timeout = Integer(timeout)
        result = ::CZMQ::FFI.zpoller_wait(self_p, timeout)
        result
      end

      # Return true if the last zpoller_wait () call ended because the timeout
      # expired, without any error.                                           
      #
      # @return [Boolean]
      def expired()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zpoller_expired(self_p)
        result
      end

      # Return true if the last zpoller_wait () call ended because the process
      # was interrupted, or the parent context was destroyed.                 
      #
      # @return [Boolean]
      def terminated()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zpoller_terminated(self_p)
        result
      end

      # Self test of this class.
      #
      # @param verbose [Boolean]
      # @return [void]
      def self.test(verbose)
        verbose = !(0==verbose||!verbose) # boolean
        result = ::CZMQ::FFI.zpoller_test(verbose)
        result
      end
    end
  end
end

################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################