module Pointer where

import Control.Monad.Eff (Eff(..))
import Debug.Trace
import Data.Function
import DOM (DOM(..))
import Signal
import Signal.Time
import Signal.DOM

-- type Touch = { id :: String
--              , screenX :: Number, screenY :: Number
--              , clientX :: Number, clientY :: Number
--              , pageX :: Number, pageY :: Number
--              , radiusX :: Number, radiusY :: Number
--              , rotationAngle :: Number, force :: Number }

--instance showTouch :: Show Touch where
  --show = "foobar"

-- foreign import pointerDownP """
--   function pointerDownP(constant) {
--     var out = constant(false);
--     function report(e) {
--       var touches = [], i, l = e.touches.length;
--       for (i = 0; i< l; i++) touches.push(e.touches.item(i));
--       out.set(touches);
--     }
--     window.addEventListener("touchstart", report);
--     return function() {
--       return out;
--     };
--   }""" :: forall e c. Fn1 (c -> Signal c) (Eff (dom :: DOM | e) (Signal [Touch]))

-- touch :: forall e. Eff (dom :: DOM | e) (Signal [Touch])
-- touch = runFn1 pointerDownP constant

showX :: forall eff. [Touch] -> Eff (trace :: Trace | eff) Unit
showX _ = print "FOOBAR"

main :: Eff (dom :: DOM, trace :: Trace) Unit
main = do
  t <- touch
  --print x
  runSignal $ t ~> showX
  print "foo"

